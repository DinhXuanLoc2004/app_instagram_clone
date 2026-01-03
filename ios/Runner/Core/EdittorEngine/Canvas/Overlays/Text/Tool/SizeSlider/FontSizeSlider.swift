//
//  FontSizeSlider.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

protocol FontSizeSliderDelegate: AnyObject {
    func onValueChanged(_: FontSizeSlider, size: CGFloat)
}

class FontSizeSlider: UIView {

    // MARK: - delegate
    weak var delegate: FontSizeSliderDelegate?
    
    // MARK: static properties
    static let width: CGFloat = 50
    static let height: CGFloat = 300
    
    // MARK: private properties
    private let marginLeading: CGFloat = 16
    private var trackView: TrackView!
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addSubViews()
        setupAutoLayout()
        
        delay(seconds: 1) {
            self.hidden()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension FontSizeSlider {
    // MARK: Private methods
    private func delay(seconds: Double, action: @escaping ( ) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: action)
    }
    
    private func animation(action: @escaping ( ) -> Void) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn]) {
            action()
        }
    }
    
    private func show(){
        animation {
            self.trackView.transform = .identity
        }
    }
    
    private func hidden(){
        let xHidden: CGFloat = -(marginLeading + TrackView.width / 2)
        let yHidden: CGFloat = 0
        animation {
            self.trackView.transform = CGAffineTransform(translationX: xHidden, y: yHidden)
        }
    }
    
    private func setupUI(){
        let press = UILongPressGestureRecognizer(target: self, action: #selector(onPress(_:)))
        press.minimumPressDuration = 0
        addGestureRecognizer(press)
        
        trackView = TrackView()
        trackView.delegate = self
    }
    
    private func addSubViews(){
        addSubview(trackView)
    }
    
    private func setupAutoLayout(){
        trackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trackView.topAnchor.constraint(equalTo: topAnchor),
            trackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: marginLeading),
            trackView.widthAnchor.constraint(equalToConstant: TrackView.width),
            trackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension FontSizeSlider {
    // MARK: - objc methods
    @objc private func onPress(_ press: UILongPressGestureRecognizer) {
        switch press.state {
        case .began:
            show()
        case .changed:
            let locationY = press.location(in: self).y
            trackView.updateValue(locationY: locationY)
        case .ended, .cancelled, .failed:
            hidden()
        default:
            break
        }
    }
}

// MARK: - implement delgates
extension FontSizeSlider: TrackViewDelegate{
    func onValueChanged(_: TrackView, size: CGFloat) {
        print("size: \(size)")
        delegate?.onValueChanged(self, size: size)
    }
}
