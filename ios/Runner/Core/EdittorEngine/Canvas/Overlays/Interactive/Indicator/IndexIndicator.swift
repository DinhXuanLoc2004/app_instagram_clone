//
//  IndexIndicator.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

class IndexIndicator: UIView {

    // MARK: - private properties
    private var items: [IndicatorItem] = []
    private var stackView: UIStackView!
    
    private var originalZPosition: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - private methods
    private func setup() {
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .leading
        stackView.backgroundColor = .black.withAlphaComponent(0.7)
        stackView.layer.cornerRadius = 5
        stackView.clipsToBounds = true

        stackView.layoutMargins = UIEdgeInsets(
            top: 8,
            left: 8,
            bottom: 8,
            right: 8
        )

        stackView.isLayoutMarginsRelativeArrangement = true

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

    private func maxZPosition() -> CGFloat {
        guard let superview = superview, let layers = superview.layer.sublayers else { return 0 }
        return layers.map { $0.zPosition }.max() ?? 0
    }
}

extension IndexIndicator {
    // MARK: - public methods
    func rebuild(count: Int) {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }

        items.removeAll()

        guard count > 1 else { return }

        for _ in 0..<count {
            let item = IndicatorItem()
            items.append(item)
        }

        items.reversed().forEach { item in
            stackView.addArrangedSubview(item)
        }
    }
    
    func highlight(index: Int) {
        for (i, item) in items.enumerated() {
            item.hightlight(i == index)
        }
    }
    
    func show(overlayStackCount: Int){
        isHidden = false
        
        originalZPosition = layer.zPosition
        layer.zPosition = maxZPosition() + 1
        
        if overlayStackCount > 1 {
            CanvasController.animation {
                self.transform = .identity
            }
        }
    }
    
    func hidden(){
        layer.zPosition = originalZPosition
        
        CanvasController.animation {
            self.transform = CGAffineTransform(translationX: -100, y: 0)
        }
    }
}
