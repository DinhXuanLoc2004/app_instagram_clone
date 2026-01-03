//
//  DeleteZone.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

class DeleteZone: UIView {

    // MARK: - static properties
    static let size: CGFloat = 40
    
    // MARK: - private perproties
    private var iconView: UIImageView!
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        layer.cornerRadius = DeleteZone.size / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
                
        iconView = UIImageView()
        iconView.tintColor = .white
        let iconTrash = UIImage(systemName: "trash")
        iconView.image = iconTrash
        
        addSubview(iconView)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DeleteZone {
    // MARK: - public methods
    func hightlight(_ active: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            if active {
                self.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.layer.borderColor = UIColor.red.cgColor
                self.iconView.tintColor = .red
            } else {
                self.transform = .identity
                self.layer.borderColor = UIColor.white.cgColor
                self.iconView.tintColor = .white
            }
        })
    }
    
    func show() {
        isHidden = false
        
        CanvasController.animation {
            self.transform = .identity
        }
        
        guard let superview = superview else {return}
        superview.bringSubviewToFront(self)
    }
    
    func hidden(){
        CanvasController.animation {
            self.transform = CGAffineTransform(translationX: 0, y: 100)
        }
    }
}
