//
//  TrackView.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

protocol TrackViewDelegate: AnyObject {
    func onValueChanged(_: TrackView, size: CGFloat)
}

class TrackView: UIView {

    // MARK: - delegate
    weak var delegate: TrackViewDelegate?
    
    // MARK: - static properties
    static let width: CGFloat = 30
    
    // MARK: Public properties
    var minValue: CGFloat = 12
    var maxValue: CGFloat = 120
    var value: CGFloat = 30 {
        didSet {
            value = min(max(value, minValue), maxValue)
            updateThumbPosition()
            print("value: \(value)")
            delegate?.onValueChanged(self, size: value)
        }
    }
    
    // MARK: private properties
    private var widthTop: CGFloat {
        TrackView.width
    }
    private var widthBottom: CGFloat = 2
    
    private var thumbRadius: CGFloat {
        TrackView.width / 2
    }
    private var thumbPadding: CGFloat {
        thumbRadius
    }
    private var trackTop: CGFloat {
        thumbPadding
    }
    private var trackBottom: CGFloat {
        bounds.height - thumbPadding
    }
    private var trackHeight: CGFloat {
        trackBottom - trackTop
    }
    
    private var thumbCenterY: CGFloat = 0
    private var didSetupInitialValue = false

    // MARK: - override
    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = .clear
        
        guard bounds.height > 0 else { return }

        if !didSetupInitialValue {
            didSetupInitialValue = true
            updateThumbPosition()
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {return}
        context.clear(rect)
        
        drawTrack(in: context)
        drawThumb(in: context)
    }
}

extension TrackView {
    // MARK: - public methods
    func updateValue(locationY: Double){
        let y = min(max(locationY, trackTop), trackBottom)
        let percent = (trackBottom - y) / trackHeight
        
        value = minValue + percent * (maxValue - minValue)
    }
}

extension TrackView {
    // MARK: - private methods
    private func drawTrack(in context: CGContext) {
        let path = UIBezierPath()
        
        let topY: CGFloat = 0
        let bottomY: CGFloat = bounds.height
        
        path.move(to: CGPoint(x: bounds.midX - widthTop / 2, y: topY))
        
        path.addLine(to: CGPoint(x: bounds.midX + widthTop / 2, y: topY))
        
        path.addLine(to: CGPoint(x: bounds.midX + widthBottom / 2, y: bottomY))
        
        path.addLine(to: CGPoint(x: bounds.midX - widthBottom / 2, y: bottomY))
        
        path.close()
        
        UIColor.white.withAlphaComponent(0.7).setFill()
        path.fill()
    }
    
    private func drawThumb(in context: CGContext){
        let thumbRect = CGRect(x: bounds.midX - thumbRadius, y: thumbCenterY - thumbRadius, width: thumbRadius * 2, height: thumbRadius * 2)
        
        let path = UIBezierPath(ovalIn: thumbRect)
        UIColor.white.setFill()
        path.fill()
    }

    private func updateThumbPosition(){
        let percent = (value - minValue) / (maxValue - minValue)
        thumbCenterY = trackBottom - percent * trackHeight
        setNeedsDisplay()
    }
}
