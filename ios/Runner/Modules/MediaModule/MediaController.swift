//
//  MediaController.swift
//  Runner
//
//  Created by User on 10/12/25.
//

import UIKit

class MediaController: UIViewController {
    
    // MARK: - Private properties
    private var deepARController: DeepARController!
    private var bottomControllerBar: BottomControllerBar!
    private var stackContrainer: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI(){
        deepARController = DeepARController()
        deepARController.delegate = self
        addChild(deepARController)
        
        bottomControllerBar = BottomControllerBar()
        
        stackContrainer = UIStackView()
        stackContrainer.addArrangedSubview(deepARController.view)
        stackContrainer.addArrangedSubview(bottomControllerBar)
        stackContrainer.axis = .vertical
        stackContrainer.alignment = .fill
        stackContrainer.distribution = .fill
        stackContrainer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackContrainer)
        view.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            stackContrainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackContrainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackContrainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackContrainer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        deepARController.didMove(toParent: self)
    }
    
}

extension MediaController: DeepARControllerDelegate {
    func dismiss(_: DeepARController) {
        dismiss(animated: true)
    }
}

extension MediaController: BottomControllerDelegate {
    func onSwitchCamera(_ bar: BottomControllerBar) {
        print("đổi camera nè..!")
    }
}
