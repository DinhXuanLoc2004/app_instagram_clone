//
//  MediaController.swift
//  Runner
//
//  Created by User on 10/12/25.
//

import UIKit

class MediaController: UIViewController {
    
    // MARK: - Private properties
    private var deepARController: CameraUseDeepARController!
    private var bottomControllerBar: BottomControllerBar!
    private var stackContrainer: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private methods
    private func setupUI(){
        deepARController = CameraUseDeepARController()
        deepARController.delegate = self
        addChild(deepARController)
        
        bottomControllerBar = BottomControllerBar()
        bottomControllerBar.delegate = self
        
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

extension MediaController: CameraUseDeepARControllerDelegate {
    func dismiss(_: CameraUseDeepARController) {
        dismiss(animated: true)
    }
    
    func takePhoto(_: CameraUseDeepARController, image: UIImage) {
        let editorController = EditorController(image: image)
        let nav = UINavigationController(rootViewController: editorController)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        
        present(nav, animated: true)
    }
}

extension MediaController: BottomControllerDelegate {
    func onSwitchCamera(_: BottomControllerBar) {
        deepARController.didTapSwitchCamera()
    }
}
