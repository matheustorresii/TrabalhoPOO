//
//  SubjectView.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

protocol SubjectViewDelegate: AnyObject {
    func didConfirm(subject: Subject)
}

class SubjectView: UIView {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: SubjectViewDelegate?

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
    
    private lazy var shiftSegmented: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: Subject.Shift.allCases.map { $0.description })
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var confirmButton: Button = {
        let button = Button()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  CONFIRMAR  ", for: .normal)
        button.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        return button
    }()

    // MARK: - INITIALIZERS
    
    init(subject: Subject?) {
        super.init(frame: .zero)
        setupView()
        if let subject = subject {
            setupWith(subject: subject)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameTextField)
        addSubview(shiftSegmented)
        addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            shiftSegmented.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            shiftSegmented.leadingAnchor.constraint(equalTo: leadingAnchor),
            shiftSegmented.trailingAnchor.constraint(equalTo: trailingAnchor),
            shiftSegmented.heightAnchor.constraint(equalToConstant: 60),
            
            confirmButton.topAnchor.constraint(greaterThanOrEqualTo: shiftSegmented.bottomAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupWith(subject: Subject) {
        nameTextField.text = subject.name
        shiftSegmented.selectedSegmentIndex = subject.shift.rawValue
    }
    
    @objc private func didTapConfirm() {
        guard let name = nameTextField.text,
              let shift = Subject.Shift(rawValue: shiftSegmented.selectedSegmentIndex) else { return }
        let subject = Subject(name: name, shift: shift)
        delegate?.didConfirm(subject: subject)
    }
}
