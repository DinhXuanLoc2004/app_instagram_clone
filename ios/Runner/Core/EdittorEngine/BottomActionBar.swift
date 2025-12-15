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
    }
    
    private func addSubViews(){
        addSubview(stackContainer)
    }
    
    private func setupAutoLayout(){
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackContainer.heightAnchor.constraint(equalToConstant: 115)
        ])
    }
    
}
