//
//  LockZone.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

class LockZone: UIView {

    // MARK: - static properties
    static let size: CGFloat = 40
    
    // MARK: - private properties
    private var iconView: UIImageView!
    private var iconLock: UIImage!
    private var originalZPosition: CGFloat = 0
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = LockZone.size / 2
                
        iconView = UIImageView()
        iconView.tintColor = .white
        iconLock = UIImage(systemName: "lock")
        iconView.image = iconLock
        
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

extension LockZone {
    // MARK: - private methods
    private func maxZPosition() -> CGFloat {
        guard let superview = superview, let layers = superview.layer.sublayers else { return 0 }
        return layers.map { $0.zPosition }.max() ?? 0
    }
    
    // MARK: public methods
    func setIcon(isLocked: Bool) {
        if isLocked {
            iconView.image = UIImage(systemName: "lock.open")
        } else {
            iconView.image = UIImage(systemName: "lock")
        }
    }
    
    func hightlight(_ active: Bool) {
        if active {
            self.backgroundColor = .white
            self.iconView.tintColor = .black
        } else {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            self.iconView.tintColor = .white
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            if active {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            } else {
                self.transform = .identity
            }
        })
    }
    
    func show(){
        isHidden = false
        originalZPosition = layer.zPosition
        layer.zPosition = maxZPosition() + 1
        CanvasController.animation {
            self.transform = .identity
        }
    }
    
    func hidden(){
        layer.zPosition = originalZPosition
        CanvasController.animation {
            self.transform = CGAffineTransform(translationX: 100, y: 0)
        }
    }
}
