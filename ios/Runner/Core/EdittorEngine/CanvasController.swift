//
//  CanvasController.swift
//  Runner
//
//  Created by User on 15/12/25.
//

import UIKit

class CanvasController: UIViewController {
    
    // MARK: - Delegate property
    weak var delegate: CanvasControllerDelegate?
    
    // MARK: - Private properties
    private var imageView: UIImageView!
    private let image: UIImage!
    private var topActions: TopActionBar!
    
    // MARK: - Init
    init(image: UIImage){
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addSubViews()
        setupAutoLayout()
    
    }
    

    // MARK: - Private methods
    private func setupUI(){
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        
        topActions = TopActionBar()
        topActions.delegate = self
        
        imageView = UIImageView()
        imageView.image = self.image
        imageView.contentMode = .scaleAspectFill
    }
    
    private func addSubViews(){
        view.addSubview(imageView)
        view.addSubview(topActions)
    }
    
    private func setupAutoLayout(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        topActions.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topActions.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            topActions.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topActions.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topActions.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

}

extension CanvasController: TopActionBarDelegate {
    func dismiss(_: TopActionBar) {
        delegate?.dismiss(self)
    }
}
