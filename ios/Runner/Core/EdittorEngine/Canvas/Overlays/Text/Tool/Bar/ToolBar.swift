//
//  ToolBar.swift
//  Runner
//
//  Created by User on 2/1/26.
//

import UIKit

enum CurrentPicker {
    case font
    case color
}

protocol ToolBarDelegate: AnyObject {
    func fontPicker(_: ToolBar, font: UIFont)
    func colorPicker(_: ToolBar, color: UIColor)
    func toggleTextAlign(_: ToolBar, textAlign: NSTextAlignment)
    func toggleBackground(_: ToolBar, textBackground: TextBackgroundType)
}

class ToolBar: UIView {
    // MARK: - delegate
    weak var delegate: ToolBarDelegate?
    
    // MARK: - private properties
    private var currentTextAliment: NSTextAlignment = .left
    private var currentBackground: TextBackgroundType = .none
    private var currentPicker: CurrentPicker = .font

    private var fontButton: UIButton!
    private var colorButton: UIView!
    private var textAlimentButton: UIButton!
    private var backgroundButton: UIButton!
    private var stackContainer: UIStackView!
    private let contentEdgeInsets = NSDirectionalEdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6)
    
    private var fontPicker: FontPicker!
    private var colorPicker: ColorPicker!
    
    private var lineVertical: UIView!
    
    private var blurEffect: UIBlurEffect!
    private var blurView: UIVisualEffectView!
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addSubViews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ToolBar {
    // MARK: - private methods
    private func setupFontButton(){
        var config = UIButton.Configuration.plain()
        config.imagePadding = 0
        config.image = UIImage(systemName: "textformat")
        config.contentInsets = contentEdgeInsets
        
        fontButton = UIButton(type: .system)
        fontButton.backgroundColor = .lightGray
        fontButton.tintColor = .white
        fontButton.layer.cornerRadius = 8
        fontButton.clipsToBounds = true
        fontButton.configuration = config
        fontButton.addTarget(self, action: #selector(tapFontButton), for: .touchUpInside)
        fontButton.isUserInteractionEnabled = true
    }
    
    
    
    private func setupColorButton(){
        let colorRing = ColorRingView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))

        colorButton = UIButton(type: .custom)
        colorButton.layer.cornerRadius = 10
        colorButton.clipsToBounds = true
        colorButton.addSubview(colorRing)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapColorButton))
        colorButton.addGestureRecognizer(tap)
        colorButton.isUserInteractionEnabled = true
        
        colorRing.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorRing.centerXAnchor.constraint(equalTo: colorButton.centerXAnchor),
            colorRing.centerYAnchor.constraint(equalTo: colorButton.centerYAnchor),
            colorRing.widthAnchor.constraint(equalToConstant: 24),
            colorRing.heightAnchor.constraint(equalToConstant: 24),
            
            colorButton.widthAnchor.constraint(equalToConstant: 34),
            colorButton.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
    
    private func togglePicker(){
        print("currentPicker: \(currentPicker)")
        switch currentPicker {
        case .font:
            fontButton.backgroundColor = .lightGray
            colorButton.backgroundColor = .clear
            
            fontPicker.isHidden = false
            colorPicker.isHidden = true
        case .color:
            colorButton.backgroundColor = .lightGray
            fontButton.backgroundColor = .clear
            
            fontPicker.isHidden = true
            colorPicker.isHidden = false
        }
    }
    
    private func setupTextAlignButton() {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 0
        config.image = UIImage(systemName: "text.alignleft")
        config.contentInsets = contentEdgeInsets
        
        textAlimentButton = UIButton(type: .system)
        textAlimentButton.backgroundColor = .clear
        textAlimentButton.tintColor = .white
        textAlimentButton.configuration = config
        textAlimentButton.addTarget(self, action: #selector(toggleTextAliment), for: .touchUpInside)
    }
    
    
    
    private func changeTextAlign(textAlign: NSTextAlignment, nameImage: String) {
        currentTextAliment = textAlign
        textAlimentButton.configuration?.image = UIImage(systemName: nameImage)
        delegate?.toggleTextAlign(self, textAlign: textAlign)
    }
    
    private func setupBackgroundButton() {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 0
        config.image = UIImage(systemName: "character")
        config.contentInsets = contentEdgeInsets
        
        backgroundButton = UIButton(type: .system)
        backgroundButton.backgroundColor = .clear
        backgroundButton.tintColor = .white
        backgroundButton.configuration = config
        backgroundButton.layer.cornerRadius = 8
        backgroundButton.layer.borderWidth = 2
        backgroundButton.layer.borderColor = UIColor.clear.cgColor
        backgroundButton.clipsToBounds = true
        backgroundButton.addTarget(self, action: #selector(toggleBackground), for: .touchUpInside)
    }
    
    private func setupUI(){
        
        setupFontButton()
        setupColorButton()
        
        lineVertical = UIView()
        lineVertical.backgroundColor = .white
        
        setupTextAlignButton()
        
        setupBackgroundButton()
        
        let leftSpace = UIView()
        let rightSpace = UIView()
                
        stackContainer = UIStackView()
        stackContainer.addArrangedSubview(fontButton)
        stackContainer.addArrangedSubview(colorButton)
        stackContainer.addArrangedSubview(lineVertical)
        stackContainer.addArrangedSubview(textAlimentButton)
        stackContainer.addArrangedSubview(backgroundButton)
        stackContainer.axis = .horizontal
        stackContainer.alignment = .center
        stackContainer.distribution = .equalSpacing
        stackContainer.spacing = 7
        stackContainer.backgroundColor = .clear
        
        blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        blurView = UIVisualEffectView(effect: blurEffect)

        blurView.layer.cornerRadius = 10
        blurView.clipsToBounds = true
        blurView.contentView.addSubview(stackContainer)
        
        fontPicker = FontPicker()
        fontPicker.delegate = self
        
        colorPicker = ColorPicker()
        colorPicker.delegate = self
        
        togglePicker()
    }
    
    private func addSubViews(){
        addSubview(fontPicker)
        addSubview(colorPicker)
        addSubview(blurView)
    }
    
    private func setupAutoLayout(){
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        fontPicker.translatesAutoresizingMaskIntoConstraints = false
        
        colorPicker.translatesAutoresizingMaskIntoConstraints = false
        
        lineVertical.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackContainer.heightAnchor.constraint(equalToConstant: 40),
            
            blurView.topAnchor.constraint(equalTo: stackContainer.topAnchor, constant: -2),
            blurView.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor, constant: -7),
            blurView.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor, constant: 7),
            blurView.bottomAnchor.constraint(equalTo: stackContainer.bottomAnchor, constant: 2),
            
            lineVertical.widthAnchor.constraint(equalToConstant: 2),
            lineVertical.heightAnchor.constraint(equalTo: stackContainer.heightAnchor, constant: -5),
            lineVertical.centerYAnchor.constraint(equalTo: stackContainer.centerYAnchor),
            
            fontPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            fontPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            fontPicker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            fontPicker.heightAnchor.constraint(equalToConstant: 50),
            
            colorPicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorPicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            colorPicker.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            colorPicker.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ToolBar {
    // MARK: - objc methods
    @objc private func tapFontButton(){
        currentPicker = .font
        togglePicker()
    }
    
    @objc private func tapColorButton(){
        currentPicker = .color
        togglePicker()
    }
    
    @objc private func toggleTextAliment() {
        if currentTextAliment == .left {
            changeTextAlign(textAlign: .center, nameImage: "text.aligncenter")
            return
        }
        if currentTextAliment == .center {
            changeTextAlign(textAlign: .right, nameImage: "text.alignright")
            return
        }
        if currentTextAliment == .right {
            changeTextAlign(textAlign: .left, nameImage: "text.alignleft")
            return
        }
    }
    
    @objc private func toggleBackground() {
        switch currentBackground {
        case .none:
            currentBackground = .solid
            backgroundButton.backgroundColor = .white
            backgroundButton.tintColor = .black
            delegate?.toggleBackground(self, textBackground: .solid)
        case .solid:
            currentBackground = .border
            backgroundButton.backgroundColor = .clear
            backgroundButton.tintColor = .white
            backgroundButton.layer.borderColor = UIColor.white.cgColor
            delegate?.toggleBackground(self, textBackground: .border)
        case .border:
            currentBackground = .none
            backgroundButton.layer.borderColor = UIColor.clear.cgColor
            delegate?.toggleBackground(self, textBackground: .none)
        }
    }
}

// MARK: - implement delegates
extension ToolBar: FontPickerDelegate {
    func picker(_: FontPicker, font: UIFont) {
        delegate?.fontPicker(self, font: font)
    }
}

extension ToolBar: ColorPickerDelegate {
    func picker(_: ColorPicker, color: UIColor) {
        delegate?.colorPicker(self, color: color)
    }
}
