//
//  DeepARController.swift
//  Runner
//
//  Created by User on 9/12/25.
//

import UIKit
import DeepAR

class DeepARController: UIViewController {
    // MARK: - Delegate property
    weak var delegate: DeepARControllerDelegate?
    
    // MARK: - Private properties
    private var dismissButton: UIButton!
    private var boltButton: UIButton!
    private var stackTopContainer: UIStackView!
    
    private var filterPicker: FilterPickerController!
    
    private let LICENSE_KEY = "08f75fda2dd3aa9faf005c89b1bc30dc20b8cfc91a2fd23ea8bc845fcd18b19799de20ffb628025d"
    private var deepAR: DeepAR!
    private var arView: UIView!
    private var cameraController: CameraController!
    
    private var effectIndex = 0
    private var effectPaths: [String?] {
        return Effects.map { $0.path.path }
    }

    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        setupDeepAR()
        setupFilterPicker()
        setupTopBarController()
        addChilds()
        addSubViews()
        setupAutoLayout()
        didMoves()
        
        startCamera()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        distroyDeepAR()
    }
            
}

extension DeepARController {
    // MARK: - Private methods
    private func setupTopBarController(){
        dismissButton = UIButton(type: .system)
        dismissButton.tintColor = .white
        dismissButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        dismissButton.addTarget(self, action: #selector(onTapDismissButton), for: .allTouchEvents)
        
        boltButton = UIButton(type: .system)
        boltButton.tintColor = .white
        boltButton.setImage(UIImage(systemName: "bolt.fill"), for: .normal)
                
        stackTopContainer = UIStackView()
        stackTopContainer.addArrangedSubview(dismissButton)
        stackTopContainer.addArrangedSubview(boltButton)
        stackTopContainer.axis = .horizontal
        stackTopContainer.alignment = .center
        stackTopContainer.distribution = .equalSpacing
    }
    
    private func setupDeepAR() {
        print("deepAR: \(String(describing: deepAR))")
        deepAR = DeepAR()
        deepAR.delegate = self
        deepAR.setLicenseKey(LICENSE_KEY)
        
        deepAR.resume()
        
        print("cameraController: \(String(describing: cameraController))")
        cameraController = CameraController()
        cameraController.deepAR = deepAR
        deepAR.videoRecordingWarmupEnabled = false
                
        print("arView: \(String(describing: arView))")
        arView = deepAR.createARView(withFrame: view.bounds)
        
    }
    
    private func startCamera(){
        cameraController.startCamera(withAudio: true)
    }
    
    private func setupFilterPicker(){
        filterPicker = FilterPickerController()
        filterPicker.delegate = self
    }
    
    private func addChilds(){
        addChild(filterPicker)
    }
    
    private func addSubViews(){
        view.addSubview(arView)
        view.addSubview(filterPicker.view)
        view.addSubview(stackTopContainer)
    }
    
    private func setupAutoLayout(){
        stackTopContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterPicker.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterPicker.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterPicker.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackTopContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackTopContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackTopContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func didMoves(){
        filterPicker.didMove(toParent: self)
    }
    
    private func distroyDeepAR(){
        cameraController.stopCamera()
        cameraController.stopAudio()
        deepAR.shutdown()
    }
    
    // MARK: - Objective methods
    @objc func onTapDismissButton(){
        delegate?.dismiss(self)
    }
}

extension DeepARController: DeepARDelegate{
    func didFinishShutdown() {
        print("didFinishShutdown...!")
    }
}

extension DeepARController: FilterPickerDelegate{
    // MARK: - Implement FilterPickerDelegate
    func picker(_ controller: FilterPickerController, didSelect index: Int) {
        if let path = effectPaths[index] {
            deepAR.switchEffect(withSlot: "effect", path: path)
        }
    }
}
