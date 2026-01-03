//
//  TextOverlay.swift
//  Runner
//
//  Created by User on 3/1/26.
//

import UIKit

protocol TextOverlayDelegate: AnyObject {
    func didStartChangeText(_: TextOverlay)
    func didEndChangeText(_: TextOverlay)
}

class TextOverlay: InteractiveOverlay {

    // MARK: - delegate
    weak var delegateSelf: TextOverlayDelegate?
    
    // MARK: - private properties
    private var textStore: NSTextStorage!
    private var layoutManager: CustomTextViewLayoutManager!
    private var textContainer: NSTextContainer!
    private var textView: UITextView!
    private var sizeText: CGFloat = 20
    private var isDelete: Bool = false
    private var fontSize: CGFloat = IGFontStyle.sizeDefault

    private lazy var heightScreen = UIScreen.main.bounds.height
    private lazy var widthScreen = UIScreen.main.bounds.width
    private var maxWidth: CGFloat {
        widthScreen * 0.75
    }
    private var safeTop: CGFloat {
        guard let window = window else {return 0}
        return window.safeAreaInsets.top
    }
    private lazy var inputAccessory: ToolEditText = {
        let toolEditText = ToolEditText()
        toolEditText.delegate = self
        return toolEditText
    }()
    
    private var currentColor: UIColor = .white
    
    // MARK: - override
    override var target: CGPoint? {
        return CGPoint(x: widthScreen / 2, y: (heightScreen - safeTop - 301) / 2)
    }
    
    override func didTap(tap: UITapGestureRecognizer) {
        if isLocked {
            playLockedShake()
            return
        }
        
        if tap.state == .ended {
            textView.isEditable = true
            textView.isSelectable = true
            textView.becomeFirstResponder()
        }
    }
    
    // MARK: - init
    init() {
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width * 0.75, height: 200)))
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: private methods
extension TextOverlay {
    private func setupUI(){
        // TextKit stack
        textStore = NSTextStorage()
        layoutManager = CustomTextViewLayoutManager()
        textContainer = NSTextContainer(size: bounds.size)
        
        textStore.addLayoutManager(layoutManager)
        layoutManager.addTextContainer(textContainer)
        
        textView = UITextView(frame: bounds, textContainer: textContainer)
        textView.isScrollEnabled = false
        textView.delegate = self
        textView.backgroundColor = .clear
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: self.fontSize)
        textView.isUserInteractionEnabled = true
        textView.clipsToBounds = false
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.layoutManager.allowsNonContiguousLayout = false
        textView.textColor = currentColor
        layoutManager.useColor = .clear
                
        addSubview(textView)
        
        textView.becomeFirstResponder()
        
    }
    
    private func setColorWithBackgroundType(backgroundType: TextBackgroundType, color: UIColor) {
        switch backgroundType {
        case .none:
            textView.textColor = color
            layoutManager.useColor = .clear
        case .solid:
            textView.textColor = color
            layoutManager.useColor = color.instagramComposerBackground()
        case .border:
            textView.textColor = color
            layoutManager.useColor = color
        }
    }
    
    private func startChangeText(){
        setCurrent()
        guard let target = target else {return}
        targetAnimation(target: target, transform: .identity)
        delegate?.didStartEdit(self)
        delegateSelf?.didStartChangeText(self)
        incrementZPosition()
    }
    
    private func endChangeText(){
        targetAnimation(target: currentCenterPoint, transform: originalTransform)
        delegate?.didEndEdit(self)
        delegateSelf?.didEndChangeText(self)
        restoreZPosition()
    }
    
    private func resizing(textView: UITextView){
        transform = .identity
        let fittingSize = textView.sizeThatFits( CGSize(width: maxWidth, height: .greatestFiniteMagnitude) )
        let oldCenter = center
        bounds.size = fittingSize
        textView.frame = bounds
        center = oldCenter
        guard let window = window else { return }
        //        let topSafe = window.safeAreaInsets.top + 10
        let topSafe: CGFloat = 25
        let scaledHeight = bounds.height * transform.d
        let topEdge = center.y - scaledHeight / 2
        if topEdge < topSafe {
            let allowedHeight = (center.y - topSafe) * 2
            let scale = max(allowedHeight / bounds.height, 0.01)
            transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}

// MARK: - implement delegate
extension TextOverlay: ToolEditTextDelegate {
    func didTapDone(_: ToolEditText) {
        if textView.text.isEmpty {
            removeFromSuperview()
        }
        inputAccessory.removeFromSuperview()
        textView.resignFirstResponder()
        textView.isEditable = false
        textView.isSelectable = false
        guard currentCenterPoint != nil else {return}
        endChangeText()
    }
    
    func changeFontSize(_: ToolEditText, size: CGFloat) {

        textView.font = textView.font?.withSize(size)
        fontSize = size
        
        resizing(textView: textView)
    }
    
    func fontPicker(_: ToolEditText, font: UIFont) {
        textView.font = font.withSize(fontSize)
        
        resizing(textView: textView)
        
        let range = NSRange(location: 0, length: textStore.length)

        layoutManager.invalidateLayout(
            forCharacterRange: range,
            actualCharacterRange: nil
        )

        layoutManager.invalidateDisplay(
            forCharacterRange: range
        )

        textView.setNeedsDisplay()
    }
    
    func colorPicker(_: ToolEditText, color: UIColor) {
        currentColor = color
        setColorWithBackgroundType(backgroundType: layoutManager.type, color: currentColor)
    }
    
    func toggleTextAlign(_: ToolEditText, textAlign: NSTextAlignment) {
        textView.textAlignment = textAlign
        
        let range = NSRange(location: 0, length: textStore.length)

        layoutManager.invalidateLayout(
            forCharacterRange: range,
            actualCharacterRange: nil
        )

        layoutManager.invalidateDisplay(
            forCharacterRange: range
        )

        textView.setNeedsDisplay()
    }
    
    func toggleBackground(_: ToolEditText, textBackground: TextBackgroundType) {
        layoutManager.type = textBackground
        setColorWithBackgroundType(backgroundType: layoutManager.type, color: currentColor)
    }
}

extension TextOverlay: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditing")
        
        startChangeText()
        resizing(textView: textView)
        
        DispatchQueue.main.async {
            let endPosition = self.textView.endOfDocument
            self.textView.selectedTextRange = self.textView.textRange(from: endPosition, to: endPosition)
        }
        
        guard let superview = superview?.superview else {return}
        
        guard inputAccessory.superview == nil else {return}
         
        superview.addSubview(inputAccessory)
        
        inputAccessory.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputAccessory.topAnchor.constraint(equalTo: superview.topAnchor),
            inputAccessory.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            inputAccessory.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            inputAccessory.bottomAnchor.constraint(equalTo: superview.keyboardLayoutGuide.topAnchor)
        ])
    }
    
    func textViewDidChange(_ textView: UITextView) {
        resizing(textView: textView)
    }
}
