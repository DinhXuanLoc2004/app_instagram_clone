//
//  BottomActionBar.swift
//  Runner
//
//  Created by User on 14/12/25.
//

import UIKit

class BottomActionBar: UIView {
    
    // MARK: - Private properties
    private var stackContainer: UIStackView!
    private var backgroundBlack: UIView!
    private var subLongPress: UILabel!

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addSubViews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - public methods
    func showSubLongPress() {
        backgroundBlack.isHidden = false
        subLongPress.isHidden = false
    }
    
    func hiddenSubLongPress(){
        backgroundBlack.isHidden = true
        subLongPress.isHidden = true
    }
    
    // MARK: - Private methods
    private func setupStackContainer(){
        stackContainer = UIStackView()
        stackContainer.axis = .horizontal
        stackContainer.alignment = .center
        stackContainer.distribution = .equalSpacing
        stackContainer.backgroundColor = .red
    }
    
    private func setupUI(){
        setupStackContainer()
        
        backgroundBlack = UIView()
        backgroundBlack.backgroundColor = .black
        backgroundBlack.isHidden = true
        
        subLongPress = UILabel()
        subLongPress.text = "Kéo lên và xuống để sắp xếp lại các lớp"
        subLongPress.textColor = .white
        subLongPress.font = .systemFont(ofSize: 14, weight: .medium)
        subLongPress.isHidden = true
    }
    
    private func addSubViews(){
        addSubview(stackContainer)
        addSubview(backgroundBlack)
        addSubview(subLongPress)
    }
    
    private func setupAutoLayout(){
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        backgroundBlack.translatesAutoresizingMaskIntoConstraints = false
        subLongPress.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackContainer.heightAnchor.constraint(equalToConstant: 100),
            
            backgroundBlack.topAnchor.constraint(equalTo: topAnchor),
            backgroundBlack.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundBlack.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundBlack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            subLongPress.centerXAnchor.constraint(equalTo: centerXAnchor),
            subLongPress.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
