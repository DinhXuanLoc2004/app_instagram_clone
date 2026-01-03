//
//  TopActionBar.swift
//  Runner
//
//  Created by User on 14/12/25.
//

import UIKit

protocol TopActionBarDelegate: AnyObject {
    func dismiss(_: TopActionBar)
    func addText(_: TopActionBar)
}

class TopActionBar: UIView {
    
    // MARK: - Delegate property
    weak var delegate: TopActionBarDelegate?

    // MARK: - Private properties
    private var dismissButton: UIButton!
    private var addTextButton: UIButton!
    private var addStickerButton: UIButton!
    private var addMusicButton: UIButton!
    private var drawButton: UIButton!
    private var saveButton: UIButton!
    
    private var stackLeading: UIStackView!
    private var stackContainer: UIStackView!
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        addTargets()
        addSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private methods
    private func setupUI(){
        dismissButton = CircleButton(systemName: "xmark")
        addTextButton = CircleButton(systemName: "textformat")
        addStickerButton = CircleButton(systemName: "face.smiling")
        addMusicButton = CircleButton(systemName: "music.note")
        drawButton = CircleButton(systemName: "pencil.tip")
        saveButton = CircleButton(systemName: "square.and.arrow.down")
        
        let spaceView = UIView()
        
        let arrangedSubviews = [dismissButton, spaceView, addTextButton, addStickerButton, addMusicButton, drawButton, saveButton]
        
        stackContainer = UIStackView()
        arrangedSubviews.reversed().forEach { stackContainer.addArrangedSubview($0!) }
        stackContainer.axis = .horizontal
        stackContainer.spacing = 12
        stackContainer.alignment = .center
        stackContainer.semanticContentAttribute = .forceRightToLeft
    }
    
    private func addTargets(){
        dismissButton.addTarget(self, action: #selector(didTapDismiss), for: .touchUpInside)
        addTextButton.addTarget(self, action: #selector(addText), for: .touchUpInside)
    }
    
    private func addSubviews(){
        addSubview(stackContainer)
    }
    
    private func setupAutoLayout(){
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackContainer.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Objective methods
    @objc private func didTapDismiss(){
        delegate?.dismiss(self)
    }
    
    @objc private func addText(){
        delegate?.addText(self)
    }

    // MARK: - public methods
    func show() {
        CanvasController.animation {
            self.transform = .identity
        }
        
        guard let superview = superview else {return}
        superview.bringSubviewToFront(self)
    }
    
    func hidden() {
        CanvasController.animation {
            self.transform = CGAffineTransform(translationX: 0, y: -60)
        }
    }
}
