//
//  TwoViewController.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

class TwoViewController: UIViewController, TwoViewControllerProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: TwoViewControllerDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: TwoViewModelProtocol
    
    // MARK: - UI
    
    private lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 20, weight: .black)
        textView.textColor = .orange
        return textView
    }()
    
    // MARK: - INITIALIZERS
    
    init(viewModel: TwoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TWO"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlert()
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .white
        createViewHierarchy()
    }
    
    private func createViewHierarchy() {
        
    }
    
    private func showAlert() {
        let message = """
                    Essa parte é referente à segunda questão e não é interativa igual a primeira, apenas uma exposição do código que pode ser visto no arquivo TWO.swift, espero que entenda e que curta o projeto!
                    """
        let alert = UIAlertController(title: "Olá :D",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "Entendi",
                              style: .default,
                              handler: nil))
        self.present(alert, animated: true) { [weak self] in
            self?.start()
        }
    }
    
    private func start() {
        textView.text = viewModel.start()
        
        view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
