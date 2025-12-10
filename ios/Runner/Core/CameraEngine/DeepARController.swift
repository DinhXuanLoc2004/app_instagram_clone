//
//  DeepARController.swift
//  Runner
//
//  Created by User on 9/12/25.
//

import UIKit
import DeepAR

class DeepARController: UIViewController {
    
    // MARK: - Private properties
    private let marginBottomFilterPicker: CGFloat = 20
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

        setupDeepAR()
        setupFilterPicker()
        setupAutoLayout()
        
        cameraController.startCamera(withAudio: true)
    }
    
}

extension DeepARController {
    // MARK: - Private methods
    private func setupDeepAR() {
        deepAR = DeepAR()
        deepAR.delegate = self
        deepAR.setLicenseKey(LICENSE_KEY)
        
        cameraController = CameraController()
        cameraController.deepAR = deepAR
        deepAR.videoRecordingWarmupEnabled = false
        
        arView = deepAR.createARView(withFrame: view.bounds)
        arView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(arView)
    }
    
    private func setupFilterPicker(){
        filterPicker = FilterPickerController()
        filterPicker.delegate = self
        addChild(filterPicker)
        view.addSubview(filterPicker.view)
        filterPicker.didMove(toParent: self)
    }
    
    private func setupAutoLayout(){
        NSLayoutConstraint.activate([
            arView.topAnchor.constraint(equalTo: view.topAnchor),
            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            filterPicker.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterPicker.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterPicker.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DeepARController: DeepARDelegate{ }

extension DeepARController: FilterPickerDelegate{
    // MARK: - Implement FilterPickerDelegate
    func picker(_ controller: FilterPickerController, didSelect index: Int) {
        if let path = effectPaths[index] {
            deepAR.switchEffect(withSlot: "effect", path: path)
        }
    }
}
