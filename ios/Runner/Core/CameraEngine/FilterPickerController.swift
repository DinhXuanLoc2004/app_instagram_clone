//
//  FilterPickerController.swift
//  Runner
//
//  Created by User on 9/12/25.
//

import UIKit

class FilterPickerController: UIViewController {
    
    // MARK: - Delegate property
    weak var delegate: FilterPickerDelegate?
    
    // MARK: - Private properties
    private let sizeCell: CGFloat = 80
    private let sizeButtonSnap: CGFloat = 80 + 13
    private let borderWidthButtonSnap: CGFloat = 4
    private let spacing: CGFloat = 40
    private let scaleFactor = 0.8 // số càng lớn thì cell càng xa center sẽ càng nhỏ
    private let alphaFactor = 0.5 // số càng lớn thì cell càng xa center sẽ càng nhỏ
    
    private var stopWorkItem: DispatchWorkItem?
    private var collectionView: UICollectionView!
    private var currentIndex: Int = 1
    
    private var buttonSnap: UIView!

    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupCollectionView()
        addSubViews()
        setupAutoLayout()
    }
    
}

extension FilterPickerController {
    // MARK: - Private methods
    private func picked(filterIndex: Int) {
        delegate?.picker(self, didSelect: filterIndex)
    }
    
    private func visibleItemsInvalidationHandler(items: [any NSCollectionLayoutVisibleItem], offset: CGPoint, env: any NSCollectionLayoutEnvironment) -> Void {
        
        let midScreenX = env.container.effectiveContentSize.width / 2
        let midScrollX = offset.x + midScreenX
        
        for item in items {
            let distance = abs(item.center.x - midScrollX)
            let normalized = min(distance / midScreenX, 1)
            
            let scale = 1 - normalized * scaleFactor
            let alpha = 1 - normalized * alphaFactor
            
            item.transform = CGAffineTransform(scaleX: scale, y: scale)
            item.alpha = alpha
        }
        
        // debounce
        // tìm item nằm giữa màn hình sau khi lướt xong
        self.stopWorkItem?.cancel()
        let task = DispatchWorkItem {
            if let itemCenter = items.min(by: {
                itemA, itemB in
                let distanceA = abs(itemA.center.x - midScrollX)
                let distanceB = abs(itemB.center.x - midScrollX)
                
                return distanceA < distanceB // tìm cell nằm gần center nhất
            }) {
                self.picked(filterIndex: itemCenter.indexPath.item)
                
                if itemCenter.indexPath.item != self.currentIndex {
                    self.currentIndex = itemCenter.indexPath.item
                    self.collectionView.reloadData()
                }
            }
        }
        self.stopWorkItem = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: task)
    }
    
    private func createLayoutCollectionView() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.sizeCell), heightDimension: .absolute(self.sizeCell))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = itemSize
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = self.spacing
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        section.visibleItemsInvalidationHandler = self.visibleItemsInvalidationHandler(items:offset:env:)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func setupUI() {
        buttonSnap = PassThroughTapView()
        buttonSnap.backgroundColor = .clear
        buttonSnap.clipsToBounds = true
        buttonSnap.layer.cornerRadius = sizeButtonSnap / 2
        buttonSnap.layer.borderColor = UIColor.white.cgColor
        buttonSnap.layer.borderWidth = borderWidthButtonSnap
    }
    
    private func setupCollectionView() {
        let layout = createLayoutCollectionView()
        collectionView = UICollectionView(frame: .zero)
        collectionView.dataSource = self
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: FilterCell.identifier)
        collectionView.decelerationRate = .normal
        collectionView.backgroundColor = .clear
    }
    
    private func addSubViews() {
        view.addSubview(collectionView)
        view.addSubview(buttonSnap)
    }
    
    private func setupAutoLayout(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        buttonSnap.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: sizeCell),
            buttonSnap.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -(sizeButtonSnap / 2)),
            buttonSnap.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -((sizeButtonSnap - sizeCell) / 2)),
            buttonSnap.heightAnchor.constraint(equalToConstant: sizeButtonSnap),
            buttonSnap.widthAnchor.constraint(equalToConstant: sizeButtonSnap)
        ])
    }
}

extension FilterPickerController: UICollectionViewDataSource {
    // MARK: - Datasource methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Effects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCell.identifier, for: indexPath) as! FilterCell
        cell.setImage(named: Effects[indexPath.item].preview)
        cell.isUserInteractionEnabled = (indexPath.item == currentIndex)
        return cell
    }
}

extension FilterPickerController: FilterCellDelegate {
    func onTapped(_ cell: FilterCell) {
        print("Cap...!")
    }
}
