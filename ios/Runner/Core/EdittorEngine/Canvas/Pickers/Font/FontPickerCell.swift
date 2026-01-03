//
//  FontPickerCell.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

class FontPickerCell: UICollectionViewCell {
    static let identifier = "FontPickerCell"
    
    private var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.borderWidth = 2
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        label = UILabel()
        label.textAlignment = .center
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

extension FontPickerCell {
    // MARK: - public methods
    func setText(_ text: String) {
        label.text = text
    }
    
    func setFont(_ font: UIFont) {
        label.font = font
    }
    
    func picker(_ isPicked: Bool){
        if isPicked {
            contentView.backgroundColor = .white
            label.textColor = .black
        } else {
            contentView.backgroundColor = .clear
            label.textColor = .white
        }
    }
}
