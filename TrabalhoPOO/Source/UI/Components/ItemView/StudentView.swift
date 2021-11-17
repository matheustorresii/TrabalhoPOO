//
//  StudentView.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

protocol StudentViewDelegate: AnyObject {
    func didConfirm(student: Student)
}

class StudentView: UIView {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: StudentViewDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    
    private var selectedIndex: Int = 0
    private lazy var courses: [Course] = {
        guard let savedData = UserDefaults.standard.data(forKey: Entity.course.identifier),
              let courses = try? PropertyListDecoder().decode([Course].self, from: savedData) else { return [] }
        return courses
    }()
    
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
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Idade"
        textField.layer.borderColor = UIColor.orange.cgColor
        textField.layer.borderWidth = 1.0
        textField.keyboardType = .numberPad
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 8, height: 1))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    private lazy var coursePicker: UIPickerView = {
        let pickerView = UIPickerView(frame: .zero)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    
    private lazy var confirmButton: Button = {
        let button = Button()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  CONFIRMAR  ", for: .normal)
        button.addTarget(self, action: #selector(didTapConfirm), for: .touchUpInside)
        return button
    }()
    
    // MARK: - INITIALIZERS
    
    init(student: Student?) {
        super.init(frame: .zero)
        setupView()
        if let student = student {
            setupWith(student: student)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameTextField)
        addSubview(ageTextField)
        addSubview(coursePicker)
        addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            ageTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: 60),
            
            coursePicker.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 8),
            coursePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            coursePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            confirmButton.topAnchor.constraint(greaterThanOrEqualTo: coursePicker.bottomAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupWith(student: Student) {
        nameTextField.text = student.name
        ageTextField.text = "\(student.age)"
    }
    
    @objc private func didTapConfirm() {
        guard let name = nameTextField.text,
              let ageText = ageTextField.text,
              let age = Int(ageText),
              let course = courses[safe: selectedIndex] else { return }
        let student = Student(name: name, age: age, course: course)
        delegate?.didConfirm(student: student)
    }
}

// MARK: - UIPickerViewDataSource

extension StudentView: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        courses.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
}

// MARK: - UIPickerViewDelegate

extension StudentView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        courses[safe: row]?.name
    }
}
