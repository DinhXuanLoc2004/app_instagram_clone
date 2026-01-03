//
//  FontPicker.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

protocol FontPickerDelegate: AnyObject {
    func picker(_: FontPicker, font: UIFont)
}

class FontPicker: UIView {

    // MARK: - delegate
    weak var delegate: FontPickerDelegate?
    
    // MARK: private properties
    private let widthItem: CGFloat = 50
    private let heightItem: CGFloat = 40
    private let spacing: CGFloat = 10
    
    private var collectionView: UICollectionView!
    private var currentIndex: Int = 0
    private var haptic: UIImpactFeedbackGenerator!

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FontPicker {
    // MARK: - private methods
    private func itemsHandler(items: [any NSCollectionLayoutVisibleItem], offset: CGPoint, env: any NSCollectionLayoutEnvironment) {
        let midScreenX = env.container.effectiveContentSize.width / 2
        let midScrollX = offset.x + midScreenX
        
        guard let itemCenter = items.min(by: {
            a, b in
            abs(a.center.x - midScrollX) < abs(b.center.x - midScrollX)
        }) else {return}
        
        let newIndex = itemCenter.indexPath.item
        guard newIndex != currentIndex else {return}
        
        let oldIndex = currentIndex
        currentIndex = newIndex
        haptic.impactOccurred()
        
        DispatchQueue.main.async {
            if let oldCell = self.collectionView.cellForItem(at: IndexPath(item: oldIndex, section: 0)) as? FontPickerCell {
                oldCell.picker(false)
            }
            
            if let newCell = self.collectionView.cellForItem(at: IndexPath(item: newIndex, section: 0)) as? FontPickerCell {
                newCell.picker(true)
            }
        }
        
        guard IGFontStyle.allCases.indices.contains(currentIndex) else {return}
        
        delegate?.picker(self, font: IGFontStyle.allCases[currentIndex].font())
    }
    
    private func createLayoutCollectionView() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(self.widthItem), heightDimension: .absolute(self.heightItem))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = itemSize
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = self.spacing
        section.orthogonalScrollingBehavior = .continuous
        
        let widthInsets = (UIScreen.main.bounds.width / 2) - widthItem / 2 - spacing * 2
        let insets = NSDirectionalEdgeInsets(top: 0, leading: widthInsets, bottom: 0, trailing: widthInsets)
        section.contentInsets = insets
        
        section.visibleItemsInvalidationHandler = self.itemsHandler(items:offset:env:)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func setupCollectionView(){
        let layout = createLayoutCollectionView()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FontPickerCell.self, forCellWithReuseIdentifier: FontPickerCell.identifier)
        collectionView.decelerationRate = .normal
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.isDirectionalLockEnabled = true
    }
    
    private func setupUI(){
        haptic = UIImpactFeedbackGenerator(style: .light, view: self)
        
        setupCollectionView()
    }
    
    private func addSubviews(){
        addSubview(collectionView)
    }
    
    private func setupAutoLayout(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: heightItem)
        ])
    }
}

extension FontPicker: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true) // chỉ cần scroll lại đúng item đã bấm thì logic trong visibleItemsInvalidationHandler sẽ tự update lại UI của item
    }
}

extension FontPicker: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return IGFontStyle.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FontPickerCell.identifier, for: indexPath) as! FontPickerCell
        
        if IGFontStyle.allCases.indices.contains(indexPath.item) {
            cell.setText(IGFontStyle.allCases[indexPath.item].rawValue)
            cell.setFont(IGFontStyle.allCases[indexPath.item].font(size: 18))
            cell.picker(currentIndex == indexPath.item)
        }
        
        return cell
    }
    
}
