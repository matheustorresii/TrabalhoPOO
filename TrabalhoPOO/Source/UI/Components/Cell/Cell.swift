//
//  Cell.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

class Cell: UITableViewCell {
    
    // MARK: - PUBLIC PROPERTIES
    
    static let reuseIdentifier: String = "Cell"
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chevronIcon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "arrowtriangle.forward.fill")?.withTintColor(.orange,renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    // MARK: - INITIALIZERS
    
    init() {
        super.init(style: .default, reuseIdentifier: Cell.reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PUBLIC METHODS
    
    func setup(with item: Item) {
        if let student = item as? Student {
            setup(with: student)
        }
        if let subject = item as? Subject {
            setup(with: subject)
        }
        if let course = item as? Course {
            setup(with: course)
        }
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        let textStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.spacing = 8
        textStackView.alignment = .leading
        textStackView.axis = .vertical
        
        let containerStackView = UIStackView(arrangedSubviews: [textStackView, chevronIcon])
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.spacing = 8
        containerStackView.alignment = .center
        containerStackView.axis = .horizontal
        
        contentView.addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setup(with student: Student) {
        titleLabel.text = "\(student.name) - \(student.age)"
        subtitleLabel.text = student.course.name
    }
    
    private func setup(with subject: Subject) {
        titleLabel.text = subject.name
        subtitleLabel.text = subject.shift.rawValue
    }
    
    private func setup(with course: Course) {
        titleLabel.text = course.name
        titleLabel.text = "\(course.grade) pontos totais"
    }
}
