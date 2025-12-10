//
//  FilterPickerCell.swift
//  Runner
//
//  Created by User on 9/12/25.
//

import UIKit

class FilterCell: UICollectionViewCell {
    // MARK: - Delegate property
    weak var delegate: FilterCellDelegate?
    
    // MARK: - Static properties
    static let identifier: String = "FilterPickerCell"
    
    // MARK: - Private properties
    private var imageView: UIImageView!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupUI() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = FilterPickerController.sizeCell/2
        
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
        
        // add tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapped))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    func setImage(named: String) {
        imageView.image = UIImage(named: named)
    }
    
    // MARK: - Objective method
    @objc private func onTapped(){
        delegate?.onTapped(self)
    }
}

extension FilterCell: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // Không block scroll
    }
}
