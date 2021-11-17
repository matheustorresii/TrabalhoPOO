//
//  CourseView.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

protocol CourseViewDelegate: AnyObject {
    func didConfirm(course: Course)
}

class CourseView: UIView {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: CourseViewDelegate?

    // MARK: - UI
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nome"
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 8, height: 1))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var gradeTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nota"
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 8, height: 1))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var confirmButton: Button = {
        let button = Button()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  CONFIRMAR  ", for: .normal)
        button.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        return button
    }()

    // MARK: - INITIALIZERS
    
    init(course: Course?) {
        super.init(frame: .zero)
        setupView()
        if let course = course {
            setupWith(course: course)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameTextField)
        addSubview(gradeTextField)
        addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            gradeTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            gradeTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradeTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradeTextField.heightAnchor.constraint(equalToConstant: 60),
            
            confirmButton.topAnchor.constraint(greaterThanOrEqualTo: gradeTextField.bottomAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupWith(course: Course) {
        nameTextField.text = course.name
        gradeTextField.text = "\(course.grade)"
    }
    
    @objc private func didTapConfirm() {
        guard let name = nameTextField.text,
              let gradeText = gradeTextField.text,
              let grade = Double(gradeText) else { return }
        let course = Course(name: name, grade: grade)
        delegate?.didConfirm(course: course)
    }
}
