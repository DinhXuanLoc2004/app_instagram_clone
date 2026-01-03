//
//  InteractiveOverlay.swift
//  Runner
//
//  Created by User on 3/1/26.
//

import UIKit

extension CGAffineTransform {
    var currentScale: CGFloat {
        sqrt(a * a + c * c)
    }
}

class InteractiveOverlay: UIView {
    
    // MARK: - delegate
    weak var delegate: InteractiveOverlayDelegate?
    
    // MARK: - open properties
    open var target: CGPoint? {
        guard let superview = superview else {return nil}
        return CGPoint(x: superview.center.x, y: superview.center.y)
    }
    
    // MARK: - private properties
    private(set) var currentCenterPoint: CGPoint!
    private(set) var originalTransform: CGAffineTransform = .identity
    private var originalZPosition: CGFloat = 0
    
    private var hasBeenInDeleteZone = false
    private var stopWorkItem: DispatchWorkItem?
    
    private var haptic: UIImpactFeedbackGenerator!
    private var isHapticed = false
    
    private(set) var isBeginLongPress = false
    private var lastLongPressY: CGFloat = 0
    
    private var hasBeenInLockZone = false
    private(set) var isLocked = false
    
    private let lockedShakeKey = "lockedShake"
    
    // MARK: - override
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        guard let target = self.target else {return}
        center = target
        setCurrent()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupGesture()
        haptic = UIImpactFeedbackGenerator(style: .heavy, view: self)
        haptic.prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: final method
extension InteractiveOverlay {
    final func setCurrent(){
        currentCenterPoint = CGPoint(x: center.x, y: center.y)
        originalTransform = transform
    }
    
    final func targetAnimation(target: CGPoint, transform: CGAffineTransform) {
        animation {
            self.center = target
            self.transform = transform
        }
    }
    
    final func incrementZPosition(){
        originalZPosition = layer.zPosition
        layer.zPosition = maxZPositionInSuperview() + 1
    }
    
    final func restoreZPosition() {
        layer.zPosition = originalZPosition
    }
    
    final func playLockedShake() {
        // tránh spam animation
        guard layer.animation(forKey: lockedShakeKey) == nil else { return }

        let angle: CGFloat = 1.5 * .pi / 180 // 1.5 độ

        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [0, -angle, angle, -angle,
                            -angle, angle, -angle,
                            -angle, angle, -angle,
                            -angle, angle, -angle,
                            -angle, angle, -angle, 0]
        animation.duration = 0.5
        animation.isAdditive = true
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        layer.add(animation, forKey: lockedShakeKey)
        
        haptic.impactOccurred()
    }
}

// MARK: private methods
extension InteractiveOverlay {
    private func setupGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(onPinch))
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(onRotation))
        
        [tap, pan, pinch, rotate].forEach { gesture in
            gesture.delegate = self
            addGestureRecognizer(gesture)
        }
        
        let press = UILongPressGestureRecognizer(target: self, action: #selector(onPress))
        press.minimumPressDuration = 0.8
        press.allowableMovement = 10
        addGestureRecognizer(press)
    }
    
    // Zone
    private func isFingerOverDeleteZonde(_ pan: UIPanGestureRecognizer, deleteZone: UIView) -> Bool {
        guard let superview = superview else {return false}
        let fingerPoint = pan.location(in: superview)
        return deleteZone.frame.contains(fingerPoint)
    }
    
    private func isFingerOverLockZonde(_ long: UILongPressGestureRecognizer, lockZone: UIView) -> Bool {
        guard let superview = superview else {return false}
        let fingerPoint = long.location(in: superview)
        return lockZone.frame.contains(fingerPoint)
    }
    
    // animation
    private func animation(code: @escaping () -> Void) {
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [.allowUserInteraction, .curveEaseOut], animations: code)
    }
    
    private func animationDelete(code: @escaping () -> Void) {
        UIView.animate(withDuration: 0.18, animations: code)
    }
    
    private func deleteWithAnimation(_ isInDeleteZone: Bool, deleteZone: UIView) {
        if isInDeleteZone && !hasBeenInDeleteZone {
            
            if !isHapticed {
                haptic.impactOccurred()
                isHapticed = true
            }
            
            self.hasBeenInDeleteZone = true
            
            let currentScale = self.transform.currentScale
            let targetScale = currentScale * 0.1
                        
            animationDelete {
                self.center = deleteZone.center
                self.transform = self.transform.scaledBy(
                                    x: 0,
                                    y: 0
                                )
                self.delegate?.inDeleteZone(self)
            }
        }
        
        if !isInDeleteZone && hasBeenInDeleteZone {
            self.isHapticed = false
            self.hasBeenInDeleteZone = false
                        
            animationDelete {
                self.transform = self.originalTransform
                self.delegate?.outDeleteZone(self)
            }
        }
    }
    
    private func maxZPositionInSuperview() -> CGFloat {
        guard let layers = superview?.layer.sublayers else { return 0 }
        return layers.map { $0.zPosition }.max() ?? 0
    }
    
    private func bringToFront(){
        guard let superview = superview else {return}
        superview.bringSubviewToFront(self)
    }
    
    private func changedForGesture(state: UIGestureRecognizer.State ,changed: @escaping @convention(block) () -> Void, ended: (() -> Void)? = nil) {
        switch state {
        case .began:
            bringToFront()
            delegate?.didStartEdit(self)
        case .changed:
            changed()
        case .ended, .cancelled, .failed:
            if let ended {
                ended()
            }
            delegate?.didEndEdit(self)
        default:
            break
        }
    }
    
    // hightlight
    private func hightlight(_ active: Bool){
        delegate?.didHightlight(self, active: active)
        self.isBeginLongPress = active
        animation {
            self.transform = active ? self.transform.scaledBy(x: 1.2, y: 1.2) : self.originalTransform
        }
    }
}

// MARK: - objc methods
extension InteractiveOverlay {
    // Open
    @objc open func didTap(tap: UITapGestureRecognizer) {
        if isLocked {
            playLockedShake()
            return
        }
        
        print("tap...!")
    }
    
    // Private
    @objc private func onPan(pan: UIPanGestureRecognizer){
        if isLocked {
            playLockedShake()
            return
        }
        
        guard let superview = superview,
              let deleteZone = superview.subviews.first(where: { $0 is DeleteZone })
        else {return}
        
        changedForGesture(state: pan.state) {
            let translation = pan.translation(in: superview)
            self.center.x += translation.x
            self.center.y += translation.y
            pan.setTranslation(.zero, in: superview)
            
            let isInDeleteZone = self.isFingerOverDeleteZonde(pan, deleteZone: deleteZone)
            
            self.deleteWithAnimation(isInDeleteZone, deleteZone: deleteZone)
        } ended: {
            self.setCurrent()
            
            if self.isFingerOverDeleteZonde(pan, deleteZone: deleteZone) {
                self.delegate?.didRemove(self)
                self.removeFromSuperview()
                self.deleteWithAnimation(false, deleteZone: deleteZone)
            }
        }

    }
    
    @objc private func onPinch(pinch: UIPinchGestureRecognizer){
        if isLocked {
            playLockedShake()
            return
        }
        
        changedForGesture(state: pinch.state) {
            self.transform = self.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            pinch.scale = 1 // reset = 1 để nó nhớ giá trị
        }
        ended: {
            self.originalTransform = self.transform
        }
    }
    
    @objc private func onRotation(rotate: UIRotationGestureRecognizer){
        if isLocked {
            playLockedShake()
            return
        }
        
        changedForGesture(state: rotate.state) {
            self.transform = self.transform.rotated(by: rotate.rotation)
            rotate.rotation = 0 // reset = 0 để nó nhớ giá trị
        }
        ended: {
            self.originalTransform = self.transform
        }
    }
    
    @objc private func onPress(_ press: UILongPressGestureRecognizer) {
        guard let superview = superview,
              let lockZone = superview.subviews.first(where: { $0 is LockZone
              })
        else {return}
        
        switch press.state {
        case .began:
            lastLongPressY = press.location(in: superview).y
            haptic.impactOccurred()
            delegate?.didStartEdit(self, isNeedDeleteZone: false)
            hightlight(true)
            delegate?.didBeginPress(self, isLocked: isLocked)
            delegate?.outLockZone(self, checkIndex: false)
            
        case .changed:
            let locationY = press.location(in: superview).y
            let deltaY = locationY - lastLongPressY
            
            if abs(deltaY) > 20 {
                if deltaY < 0 {
                    delegate?.onChangeTransformPress(self, direction: .up)
                } else {
                    delegate?.onChangeTransformPress(self, direction: .down)
                }
                lastLongPressY = locationY
            }
            
            let isInLockZone = isFingerOverLockZonde(press, lockZone: lockZone)
            
            if isInLockZone && !hasBeenInLockZone {
                if !isHapticed {
                    haptic.impactOccurred()
                    isHapticed = true
                }
                
                hasBeenInLockZone = true
                delegate?.inLockZone(self)
            }
            
            if !isInLockZone && hasBeenInLockZone {
                isHapticed = false
                hasBeenInLockZone = false
                delegate?.outLockZone(self, checkIndex: true)
            }
            
        case .ended, .cancelled, .failed:
            if hasBeenInLockZone {
                isLocked = !isLocked
            }
            
            delegate?.didEndEdit(self)
            hightlight(false)
            delegate?.didEndPress(self)
            
        default:
            break
        }
    }
}

// MARK: - implement delegates
extension InteractiveOverlay: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if isBeginLongPress {
            return gestureRecognizer is UILongPressGestureRecognizer
        }
        
        return true // đặt là true để các gesture hoạt động song song
    }
}
