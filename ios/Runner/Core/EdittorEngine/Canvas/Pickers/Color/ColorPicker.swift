//
//  ColorPickerCollection.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

protocol ColorPickerDelegate: AnyObject {
    func picker(_: ColorPicker, color: UIColor)
}

class ColorPicker: UIView {
    // MARK: - delegate
    weak var delegate: ColorPickerDelegate?
    
    // MARK: - private properties
    private let contentInsetItem: CGFloat = 6
    private let countItemForGroup: Int = 9
    
    private var colorCollection: UICollectionView!
    private var indexPicked: Int = 0
    
    private var pageControl: UIPageControl!
    private var currentPage = 0
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addSubViews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColorPicker {
    // MARK: - private methods
    private func createLayoutCollection() -> UICollectionViewCompositionalLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(ColorPickerCell.size), heightDimension: .absolute(ColorPickerCell.size))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = .init(leading: NSCollectionLayoutSpacing.fixed(contentInsetItem), top: nil, trailing: NSCollectionLayoutSpacing.fixed(contentInsetItem), bottom: nil)
        
        let groupWidth: CGFloat = (ColorPickerCell.size + contentInsetItem * 2) * CGFloat(countItemForGroup)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(ColorPickerCell.size))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 9)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = contentInsetItem * 15
        
        section.visibleItemsInvalidationHandler = {
            items, offset, env in
            
            let pageWidth = env.container.contentSize.width
            let page = Int(round(offset.x / pageWidth))
            
            guard page != self.currentPage else {return}
            
            self.currentPage = page
            
            DispatchQueue.main.async {
                self.pageControl.currentPage = self.currentPage
            }
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func setupColorCollection(){
        let layout = createLayoutCollection()
        
        colorCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colorCollection.delegate = self
        colorCollection.dataSource = self
        colorCollection.register(ColorPickerCell.self, forCellWithReuseIdentifier: ColorPickerCell.identifier)
        colorCollection.backgroundColor = .clear
        colorCollection.alwaysBounceVertical = false
        colorCollection.alwaysBounceHorizontal = true
        colorCollection.isDirectionalLockEnabled = true
    }
    
    private func setupUI(){
        setupColorCollection()
        
        pageControl = UIPageControl()
        pageControl.numberOfPages = Colors.count / countItemForGroup
        pageControl.currentPage = currentPage
    }
    
    private func addSubViews(){
        addSubview(colorCollection)
        addSubview(pageControl)
    }
    
    private func setupAutoLayout(){
        colorCollection.translatesAutoresizingMaskIntoConstraints = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            colorCollection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            colorCollection.heightAnchor.constraint(equalToConstant: ColorPickerCell.size),
            
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ColorPicker: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let new = indexPath.item
        guard new != indexPicked else {return}
        
        let old = indexPicked
        indexPicked = new
        
        DispatchQueue.main.async {
            if let oldCell = collectionView.cellForItem(at: IndexPath(item: old, section: 0)) as? ColorPickerCell {
                oldCell.picker(false)
            }
            
            if let newCell = collectionView.cellForItem(at: IndexPath(item: new, section: 0)) as? ColorPickerCell {
                newCell.picker(true)
            }
        }
        
        delegate?.picker(self, color: Colors[indexPicked])
    }
}

extension ColorPicker: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorPickerCell.identifier, for: indexPath) as! ColorPickerCell
        cell.setBackground(Colors[indexPath.item])
        cell.picker(indexPath.item == indexPicked)
        return cell
    }
    
    
}
