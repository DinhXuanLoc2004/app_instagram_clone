//
//  Untitled.swift
//  Runner
//
//  Created by User on 13/12/25.
//

class EditorController: UIViewController {
      
    // MARK: - Private properties
    private let image: UIImage
    private var canvasController: CanvasController!
    private var bottomActionBar: BottomActionBar!
    private var stackContainer: UIStackView!
    
    // MARK: - Init
    init(image: UIImage){
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubViews()
        setupAutoLayout()
    }
    
    // MARK: - Private methods
    private func setupUI(){
        canvasController = CanvasController(image: self.image)
        canvasController.delegate = self
        
        bottomActionBar = BottomActionBar()
        
        stackContainer = UIStackView()
        stackContainer.addArrangedSubview(canvasController.view)
        stackContainer.addArrangedSubview(bottomActionBar)
        
        stackContainer.axis = .vertical
        stackContainer.alignment = .fill
        stackContainer.distribution = .fill
    }
    
    private func addSubViews(){
        view.addSubview(stackContainer)
    }
    
    private func setupAutoLayout(){
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension EditorController: CanvasControllerDelegate {
    func dismiss(_: CanvasController) {
        print("Dismiss Editor controller...!")
        dismiss(animated: true)
    }
}
