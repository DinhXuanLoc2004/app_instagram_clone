//
//  ToolEditText.swift
//  Runner
//
//  Created by User on 3/1/26.
//

import UIKit

protocol ToolEditTextDelegate: AnyObject {
    func didTapDone(_: ToolEditText)
    func changeFontSize(_: ToolEditText, size: CGFloat)
    func fontPicker(_: ToolEditText, font: UIFont)
    func colorPicker(_: ToolEditText, color: UIColor)
    func toggleTextAlign(_: ToolEditText, textAlign: NSTextAlignment)
    func toggleBackground(_: ToolEditText, textBackground: TextBackgroundType)
}

class ToolEditText: UIView {

    // MARK: - delegate
    weak var delegate: ToolEditTextDelegate?
    
    // MARK: - private properties
    private var doneButton: UIButton!
    private var fontSizeSlider: FontSizeSlider!
    private var toolBar: ToolBar!
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = false
        
        setupUI()
        addSubViews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ToolEditText {
    // MARK: - private methods
    private func setupDoneButton(){
        let button = UIButton(type: .system)
        button.setTitle("Xong", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)

        button.addTarget(
            self,
            action: #selector(didTapDoneButton),
            for: .touchUpInside
        )
        
        doneButton = button
    }
    
    private func setupUI(){
        setupDoneButton()
        
        fontSizeSlider = FontSizeSlider()
        fontSizeSlider.delegate = self
        
        toolBar = ToolBar()
        toolBar.delegate = self
    }
    
    private func addSubViews(){
        addSubview(doneButton)
        addSubview(toolBar)
        addSubview(fontSizeSlider)
    }
    
    private func setupAutoLayout(){
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        fontSizeSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            toolBar.heightAnchor.constraint(equalToConstant: 100),
            
            doneButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            fontSizeSlider.leadingAnchor.constraint(equalTo: leadingAnchor),
            fontSizeSlider.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            fontSizeSlider.widthAnchor.constraint(equalToConstant: FontSizeSlider.width),
            fontSizeSlider.heightAnchor.constraint(equalToConstant: FontSizeSlider.height)
        ])
    }
    
    // MARK: - objc methods
    @objc private func didTapDoneButton(){
        delegate?.didTapDone(self)
    }
}

// MARK: - implement delegates
extension ToolEditText: ToolBarDelegate {
    func fontPicker(_: ToolBar, font: UIFont) {
        delegate?.fontPicker(self, font: font)
    }
    
    func colorPicker(_: ToolBar, color: UIColor) {
        delegate?.colorPicker(self, color: color)
    }
    
    func toggleTextAlign(_: ToolBar, textAlign: NSTextAlignment) {
        delegate?.toggleTextAlign(self, textAlign: textAlign)
    }
    
    func toggleBackground(_: ToolBar, textBackground: TextBackgroundType) {
        delegate?.toggleBackground(self, textBackground: textBackground)
    }
}

extension ToolEditText: FontSizeSliderDelegate {
    func onValueChanged(_: FontSizeSlider, size: CGFloat) {
        delegate?.changeFontSize(self, size: size)
    }
}
