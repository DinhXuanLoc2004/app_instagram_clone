//
//  DeepARController.swift
//  Runner
//
//  Created by User on 9/12/25.
//

import UIKit
import DeepAR

enum DeepARState {
    case unInit
    case running
    case shutdowned
}

protocol CameraUseDeepARControllerDelegate: AnyObject {
    func dismiss(_: CameraUseDeepARController)
    func takePhoto(_: CameraUseDeepARController, image: UIImage)
}

class CameraUseDeepARController: UIViewController {
    // MARK: - Delegate property
    weak var delegate: CameraUseDeepARControllerDelegate?
    
    // MARK: - Private properties
    private var dismissButton: UIButton!
    private var boltButton: UIButton!
    private var stackTopContainer: UIStackView!
    
    private var filterPicker: FilterPicker!
    
    private var deepARState: DeepARState = .unInit
    private let LICENSE_KEY = "08f75fda2dd3aa9faf005c89b1bc30dc20b8cfc91a2fd23ea8bc845fcd18b19799de20ffb628025d"
    private var deepAR: DeepAR!
    private var arView: UIView!
    private var cameraController: CameraController!
    private var cameraPosition: AVCaptureDevice.Position = .front
    
    private var effectIndex = 0
    private var effectPaths: [String?] {
        return Effects.map { $0.path.path }
    }

    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad DeepARController...!")

        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        setupDeepAR()
        setupFilterPicker()
        setupTopBarController()
        addSubViews()
        setupAutoLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear DeepARController...!")
        
        if deepARState == .shutdowned {
            setupDeepAR()
            setupTopBarController()
            addSubViews()
            setupAutoLayout()
        }
        
        startCamera()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear DeepARController...!")
        distroyDeepAR()
    }
            
}

extension CameraUseDeepARController {
    // MARK: - Private methods
    private func setupTopBarController(){
        dismissButton = UIButton(type: .system)
        dismissButton.tintColor = .white
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        dismissButton.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
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
        deepARState = .running
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
        cameraController.position = cameraPosition
        cameraController.startCamera(withAudio: true)
    }
    
    private func setupFilterPicker(){
        filterPicker = FilterPicker()
        filterPicker.delegate = self
    }
        
    private func addSubViews(){
        view.addSubview(arView)
        view.addSubview(stackTopContainer)
        view.addSubview(filterPicker)
    }
    
    private func setupAutoLayout(){
        stackTopContainer.translatesAutoresizingMaskIntoConstraints = false
        filterPicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            filterPicker.heightAnchor.constraint(equalToConstant: FilterPicker.height),
            stackTopContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackTopContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackTopContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
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
    
    // MARK: - Public methods
    func didTapSwitchCamera(){
        if cameraPosition == .front {
            cameraController.position = .back
            cameraPosition = .back
        } else {
            cameraController.position = .front
            cameraPosition = .front
        }
    }
}

extension CameraUseDeepARController: DeepARDelegate{
    func didFinishShutdown() {
        print("didFinishShutdown...!")
        deepARState = .shutdowned
    }
    
    func didTakeScreenshot(_ screenshot: UIImage!) {
        guard let image = screenshot else {return}
        delegate?.takePhoto(self, image: image)
    }
}

extension CameraUseDeepARController: FilterPickerDelegate{
    // MARK: - Implement FilterPickerDelegate
    func picker(_: FilterPicker, didSelect index: Int) {
        if let path = effectPaths[index] {
            deepAR.switchEffect(withSlot: "effect", path: path)
        }
    }
    
    func takePhoto(_: FilterPicker) {
        print("take photo...!")
        deepAR.takeScreenshot()
    }
}
