//
//  ColorRingView.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

class ColorRingView: UIView {

    // MARK: - private properties
    private let gradientLayer = CAGradientLayer()
    private let whiteRingLayer = CAShapeLayer()

    // MARK: - override
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutLayers()
    }

}

extension ColorRingView {
    // MARK: private methods
    private func setup() {
        backgroundColor = .clear

        gradientLayer.colors = [
            UIColor.systemRed.cgColor,
            UIColor.systemOrange.cgColor,
            UIColor.systemYellow.cgColor,
            UIColor.systemGreen.cgColor,
            UIColor.systemBlue.cgColor,
            UIColor.systemPurple.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemRed.cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 1, y: 1)

        layer.addSublayer(gradientLayer)

        whiteRingLayer.fillColor = UIColor.clear.cgColor
        whiteRingLayer.strokeColor = UIColor.white.cgColor
        whiteRingLayer.lineCap = .round
        layer.addSublayer(whiteRingLayer)
    }
    
    private func layoutLayers() {
        let ringWidth: CGFloat = 2

        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = bounds.width / 2
        gradientLayer.masksToBounds = true

        let radius = min(bounds.width, bounds.height) / 2 - ringWidth / 2
        let center = CGPoint(x: bounds.midX, y: bounds.midY)

        let ringPath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: .pi * 3 / 2,
            clockwise: true
        )

        whiteRingLayer.path = ringPath.cgPath
        whiteRingLayer.lineWidth = ringWidth
    }



}
