//
//  InteractiveOverlayDelegate.swift
//  Runner
//
//  Created by User on 3/1/26.
//
enum MoveDirection {
    case up
    case down
}

protocol InteractiveOverlayDelegate: AnyObject {
    // change transform
    func didStartEdit(_: InteractiveOverlay, isNeedDeleteZone: Bool)
    func didEndEdit(_: InteractiveOverlay)
    
    // zone
    func inDeleteZone(_: InteractiveOverlay)
    func outDeleteZone(_: InteractiveOverlay)
    func inLockZone(_: InteractiveOverlay)
    func outLockZone(_: InteractiveOverlay, checkIndex: Bool)
    
    // hightlight
    func didHightlight(_: InteractiveOverlay, active: Bool)
    
    // press
    func didBeginPress(_: InteractiveOverlay, isLocked: Bool)
    func onChangeTransformPress(_ overlay: InteractiveOverlay, direction: MoveDirection)
    func didEndPress(_: InteractiveOverlay)
    
    // remove
    func didRemove(_ overlay: InteractiveOverlay)
}

// MARK: - method default
extension InteractiveOverlayDelegate {
    func didStartEdit(_ interactiveOverlay: InteractiveOverlay) {
        didStartEdit(interactiveOverlay, isNeedDeleteZone: true)
    }
    
    func outLockZone(_ interactiveOverlay: InteractiveOverlay) {
        outLockZone(interactiveOverlay, checkIndex: false)
    }
}
