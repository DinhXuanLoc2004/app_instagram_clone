//
//  BottomControllerBar.swift
//  Runner
//
//  Created by User on 10/12/25.
//

import UIKit

class BottomControllerBar: UIView {

    // MARK: - Delegate property
    weak var delegate: BottomControllerDelegate?
    
    // MARK: - Private properties
    private let sizeSelectImageButton: CGFloat = 50
    private let marginHorizontal: CGFloat = 16
    private let heightStackContainer: CGFloat = 115
    
    private var selectImageButton: UIView!
    private var storyLabel: UILabel!
    private var toggleCameraButton: UIView!
    private var stackContainer: UIStackView!
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        setupUI()
        addSubViews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Objective methods
    @objc private func toggoleCamera(){
        delegate?.onSwitchCamera(self)
    }
    
    // MARK: - Private methods
    private func setupSelectImageButton(){
        selectImageButton = UIView()
        selectImageButton.layer.cornerRadius = 10
        selectImageButton.backgroundColor = .blue
    }
    
    private func setupStoryLable(){
        storyLabel = UILabel()
        storyLabel.text = "TIN"
        storyLabel.font = UIFont.systemFont(ofSize: 20)
        storyLabel.textColor = .white
    }
    
    private func setupToggleCameraButton(){
        toggleCameraButton = UIView()
        toggleCameraButton.layer.cornerRadius = sizeSelectImageButton / 2
        toggleCameraButton.clipsToBounds = true
        toggleCameraButton.backgroundColor = .red
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggoleCamera))
        toggleCameraButton.addGestureRecognizer(tap)
        toggleCameraButton.isUserInteractionEnabled = true
    }
    
    private func setupStackContainer(){
        stackContainer = UIStackView()
        stackContainer.addArrangedSubview(selectImageButton)
        stackContainer.addArrangedSubview(storyLabel)
        stackContainer.addArrangedSubview(toggleCameraButton)
        stackContainer.axis = .horizontal
        stackContainer.alignment = .center
        stackContainer.distribution = .equalSpacing
    }
    
    private func setupUI(){
        setupSelectImageButton()
        setupStoryLable()
        setupToggleCameraButton()
        setupStackContainer()
    }
    
    private func addSubViews(){
        addSubview(stackContainer)
    }
    
    private func setupAutoLayout(){
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        toggleCameraButton.translatesAutoresizingMaskIntoConstraints = false
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectImageButton.heightAnchor.constraint(equalToConstant: sizeSelectImageButton),
            selectImageButton.widthAnchor.constraint(equalToConstant: sizeSelectImageButton),
            
            toggleCameraButton.heightAnchor.constraint(equalToConstant: sizeSelectImageButton),
            toggleCameraButton.widthAnchor.constraint(equalToConstant: sizeSelectImageButton),
            
            stackContainer.topAnchor.constraint(equalTo: topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: marginHorizontal),
            stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: marginHorizontal * -1),
            stackContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackContainer.heightAnchor.constraint(equalToConstant: heightStackContainer)
        ])
    }

}
