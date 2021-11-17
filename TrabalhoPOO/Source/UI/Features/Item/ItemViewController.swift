//
//  ItemViewController.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

class ItemViewController: UIViewController, ItemViewControllerProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: ItemViewControllerDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: ItemViewModelProtocol
    
    // MARK: - UI
    
    // MARK: - INITIALIZERS
    
    init(viewModel: ItemViewModelProtocol) {
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
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .white
        
        switch viewModel.getEntity() {
        case .student: setup(student: viewModel.getItem() as? Student)
        case .subject: setup(subject: viewModel.getItem() as? Subject)
        case .course: setup(course: viewModel.getItem() as? Course)
        }
    }
    
    private func setup(student: Student?) {
        let studentView = StudentView(student: student)
        studentView.delegate = self
        constraint(myView: studentView)
    }
    
    private func setup(subject: Subject?) {
        let subjectView = SubjectView(subject: subject)
        subjectView.delegate = self
        constraint(myView: subjectView)
    }
    
    private func setup(course: Course?) {
        let courseView = CourseView(course: course)
        courseView.delegate = self
        constraint(myView: courseView)
    }
    
    private func constraint(myView: UIView) {
        view.addSubview(myView)
        
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}

// MARK: - StudentViewDelegate

extension ItemViewController: StudentViewDelegate {
    func didConfirm(student: Student) {
        viewModel.add(student: student)
        delegate?.navigateBack()
    }
}

// MARK: - SubjectViewDelegate

extension ItemViewController: SubjectViewDelegate {
    func didConfirm(subject: Subject) {
        viewModel.add(subject: subject)
        delegate?.navigateBack()
    }
}

// MARK: - CourseViewDelegate

extension ItemViewController: CourseViewDelegate {
    func didConfirm(course: Course) {
        viewModel.add(course: course)
        delegate?.navigateBack()
    }
}
