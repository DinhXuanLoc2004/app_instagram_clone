//
//  ColorPickerCell.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

class ColorPickerCell: UICollectionViewCell {
    static let identifier: String = "ColorPickerCell"
    static let size: CGFloat = 25
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 6
        clipsToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        
        widthAnchor.constraint(equalToConstant: ColorPickerCell.size).isActive = true
        heightAnchor.constraint(equalToConstant: ColorPickerCell.size).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColorPickerCell {
    // MARK: - public methods
    func setBackground(_ color: UIColor) {
        backgroundColor = color
    }
    
    func picker(_ isPicked: Bool){
        if isPicked {
            layer.borderWidth = 3
        } else {
            layer.borderWidth = 1
        }
    }
}
