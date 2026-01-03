//
//  IndicatorItem.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

class IndicatorItem: UIView {

    // MARK: - private properties
    private let dotSize: CGFloat = 6
    private let highlightWidth: CGFloat = 20

    private var widthConstraint: NSLayoutConstraint!

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = dotSize / 2

        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: dotSize)
        ])

        widthConstraint = widthAnchor.constraint(equalToConstant: dotSize)
        widthConstraint.isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("No implement coder")
    }

    // MARK: public methods
    func hightlight(_ highlighted: Bool) {
        UIView.animate(
            withDuration: highlighted ? 0.28 : 0.18,
            delay: 0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 0.6,
            options: [.curveEaseOut]
        ) {
            self.widthConstraint.constant = highlighted
                ? self.highlightWidth
                : self.dotSize

            self.layer.cornerRadius = highlighted
                ? self.dotSize / 2
                : self.dotSize / 2

            self.superview?.layoutIfNeeded()
        }
        
    }
}
