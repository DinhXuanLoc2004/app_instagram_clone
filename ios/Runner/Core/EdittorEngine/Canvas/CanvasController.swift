//
//  CanvasController.swift
//  Runner
//
//  Created by User on 15/12/25.
//

import UIKit

protocol CanvasControllerDelegate: AnyObject {
    func dismiss(_: CanvasController)
    func didBeginHightlightInteractive(_: CanvasController)
    func didEndHightlightInteractive(_: CanvasController)
}

class CanvasController: UIViewController {
    
    // MARK: - Delegate property
    weak var delegate: CanvasControllerDelegate?
    
    // MARK: - Private properties
    private var imageView: UIImageView!
    private let image: UIImage!
    private var topActions: TopActionBar!
    
    private var deleteZone: DeleteZone!
    private var lockZone: LockZone!
    
    private var backgroundBlack: UIView!
    private var originalZPositionBackground: CGFloat = 0
    
    private var overlayStack: [InteractiveOverlay] = []
    private var beginIndex: Int?
    private var workingIndex: Int?
    private var isPreviewingLock = false
    
    private var indexIndicator: IndexIndicator!
    
    // MARK: - Init
    init(image: UIImage){
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addSubViews()
        setupAutoLayout()
    
    }
    
    // MARK: - static method
    static func animation(animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.30,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.5,
            animations: animations,
            completion: completion
        )
    }

    // MARK: - Private methods
    private func setupUI(){
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        topActions = TopActionBar()
        topActions.delegate = self
        
        imageView = UIImageView()
        imageView.image = self.image
        imageView.contentMode = .scaleAspectFill
        
        deleteZone = DeleteZone()
        deleteZone.isHidden = true
        
        lockZone = LockZone()
        lockZone.isHidden = true
        
        backgroundBlack = UIView()
        backgroundBlack.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        backgroundBlack.isHidden = true
        
        indexIndicator = IndexIndicator()
        indexIndicator.isHidden = true
    }
    
    private func addSubViews(){
        view.addSubview(imageView)
        view.addSubview(topActions)
        view.addSubview(deleteZone)
        view.addSubview(lockZone)
        view.addSubview(backgroundBlack)
        view.addSubview(indexIndicator)
    }
    
    private func setupAutoLayout(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        topActions.translatesAutoresizingMaskIntoConstraints = false
        deleteZone.translatesAutoresizingMaskIntoConstraints = false
        lockZone.translatesAutoresizingMaskIntoConstraints = false
        backgroundBlack.translatesAutoresizingMaskIntoConstraints = false
        indexIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topActions.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            topActions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topActions.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topActions.heightAnchor.constraint(equalToConstant: 44),
            
            deleteZone.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteZone.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            deleteZone.heightAnchor.constraint(equalToConstant: DeleteZone.size),
            deleteZone.widthAnchor.constraint(equalToConstant: DeleteZone.size),
            
            lockZone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lockZone.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            lockZone.heightAnchor.constraint(equalToConstant: LockZone.size),
            lockZone.widthAnchor.constraint(equalToConstant: LockZone.size),
            
            backgroundBlack.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundBlack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundBlack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundBlack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            indexIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            indexIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func maxZPosition() -> CGFloat {
        guard let layers = view?.layer.sublayers else { return 0 }
        return layers.map { $0.zPosition }.max() ?? 0
    }
    
    private func showBackground(checkCountInteractive: Bool = false){
        backgroundBlack.isHidden = false
        if !checkCountInteractive {
            originalZPositionBackground = backgroundBlack.layer.zPosition
            let maxZPosition = maxZPosition()
            backgroundBlack.layer.zPosition = maxZPosition + 1
        }
    }
    
    private func hiddenBackground(){
        backgroundBlack.isHidden = true
        backgroundBlack.layer.zPosition = originalZPositionBackground
    }
    
    private func rebuildOverlayHierarchy(index: Int, targetIndex: Int) {
        guard index != targetIndex else { return }
        
        indexIndicator.highlight(index: targetIndex)
        overlayStack.swapAt(index, targetIndex)
        
        overlayStack.forEach { interactive in
            view.bringSubviewToFront(interactive)
        }
        
        UIImpactFeedbackGenerator(style: .light, view: self.view).impactOccurred()
    }

    private func addInteractive(){
        topActions.hidden()
        deleteZone.hidden()
        lockZone.hidden()
    }
}

// MARK: - implement delegates
extension CanvasController: TopActionBarDelegate {
    func dismiss(_: TopActionBar) {
        delegate?.dismiss(self)
    }
    
    func addText(_: TopActionBar) {
        let newText = TextOverlay()
        newText.delegate = self
        newText.delegateSelf = self
        
        overlayStack.append(newText)
        view.addSubview(newText)
        indexIndicator.rebuild(count: overlayStack.count)
        
        addInteractive()
    }
}

extension CanvasController: TextOverlayDelegate {
    func didStartChangeText(_: TextOverlay) {
        showBackground()
    }
    
    func didEndChangeText(_: TextOverlay) {
        hiddenBackground()
    }
}

extension CanvasController: InteractiveOverlayDelegate {
    func didStartEdit(_: InteractiveOverlay, isNeedDeleteZone: Bool) {
        topActions.hidden()
        
        if isNeedDeleteZone {
            deleteZone.show()
        }
    }
    
    func didEndEdit(_: InteractiveOverlay) {
        topActions.show()
        deleteZone.hidden()
    }
    
    func inDeleteZone(_: InteractiveOverlay) {
        deleteZone.hightlight(true)
    }
    
    func outDeleteZone(_: InteractiveOverlay) {
        deleteZone.hightlight(false)
    }
    
    func inLockZone(_: InteractiveOverlay) {
        lockZone.hightlight(true)
        
        guard let begin = beginIndex,
              let current = workingIndex,
              begin != current,
              !isPreviewingLock
        else {return}
        
        isPreviewingLock = true
        
        rebuildOverlayHierarchy(index: current, targetIndex: begin)
    }
    
    func outLockZone(_: InteractiveOverlay, checkIndex: Bool) {
        lockZone.hightlight(false)
        
        guard checkIndex,
              let begin = beginIndex,
              let current = workingIndex,
              begin != current,
              isPreviewingLock
        else {return}
        
        isPreviewingLock = false
        
        rebuildOverlayHierarchy(index: begin, targetIndex: current)
    }
    
    func didHightlight(_: InteractiveOverlay, active: Bool) {
        if active {
            showBackground(checkCountInteractive: true)
            delegate?.didBeginHightlightInteractive(self)
        } else {
            hiddenBackground()
            delegate?.didEndHightlightInteractive(self)
        }
    }
    
    func didBeginPress(_: InteractiveOverlay, isLocked: Bool) {
        lockZone.setIcon(isLocked: isLocked)
        lockZone.show()
        indexIndicator.show(overlayStackCount: overlayStack.count)
        
        guard let overlay = overlayStack.last(where: { $0.isBeginLongPress}),
              let index = overlayStack.firstIndex(of: overlay)
        else {return}
        indexIndicator.highlight(index: index)
        
        beginIndex = index
        workingIndex = index
        isPreviewingLock = false
    }
    
    func onChangeTransformPress(_ overlay: InteractiveOverlay, direction: MoveDirection) {
        guard let index = overlayStack.firstIndex(of: overlay) else { return }
        
        let targetIndex: Int
        switch direction {
        case .up:
            targetIndex = min(index + 1, overlayStack.count - 1)
        case .down:
            targetIndex = max(index - 1, 0)
        }
        
        workingIndex = targetIndex
        
        rebuildOverlayHierarchy(index: index, targetIndex: targetIndex)
       
        workingIndex = overlayStack.firstIndex(of: overlay)
    }
    
    func didEndPress(_: InteractiveOverlay) {
        beginIndex = nil
        workingIndex = nil
        isPreviewingLock = false
        lockZone.hidden()
        indexIndicator.hidden()
    }
    
    func didRemove(_ overlay: InteractiveOverlay) {
        guard let index = overlayStack.firstIndex(of: overlay) else {return}
        deleteZone.hidden()
        overlayStack.remove(at: index)
        indexIndicator.rebuild(count: overlayStack.count)
    }
    
}
