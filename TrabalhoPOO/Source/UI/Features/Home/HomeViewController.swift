//
//  HomeViewController.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import UIKit

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: HomeViewModelProtocol
    
    // MARK: - UI
    
    private lazy var studentButton: Button = {
        let button = Button()
        button.setTitle("  GERENCIAR ALUNOS  ", for: .normal)
        button.addTarget(self, action: #selector(goToStudents), for: .touchUpInside)
        return button
    }()
    
    private lazy var subjectButton: Button = {
        let button = Button()
        button.setTitle("  GERENCIAR DISCIPLINAS   ", for: .normal)
        button.addTarget(self, action: #selector(goToSubjects), for: .touchUpInside)
        return button
    }()
    
    private lazy var courseButton: Button = {
        let button = Button()
        button.setTitle("  GERENCIAR CURSOS  ", for: .normal)
        button.addTarget(self, action: #selector(goToCourses), for: .touchUpInside)
        return button
    }()
    
    // MARK: - INITIALIZERS
    
    init(viewModel: HomeViewModelProtocol) {
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
        title = "MENU"
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .white
        createViewHierarchy()
    }
    
    private func createViewHierarchy() {
        let stackView = UIStackView(arrangedSubviews: [studentButton, subjectButton, courseButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            studentButton.widthAnchor.constraint(equalToConstant: 288),
            subjectButton.widthAnchor.constraint(equalToConstant: 288),
            courseButton.widthAnchor.constraint(equalToConstant: 288)
        ])
    }
    
    @objc private func goToStudents() {
        delegate?.navigateToList(type: .student)
    }
    
    @objc private func goToSubjects() {
        delegate?.navigateToList(type: .subject)
    }
    
    @objc private func goToCourses() {
        delegate?.navigateToList(type: .course)
    }
}
