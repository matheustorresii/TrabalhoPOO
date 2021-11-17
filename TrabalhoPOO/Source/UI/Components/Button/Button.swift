//
//  Button.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

class Button: UIButton {
    
    // MARK: - INITIALIZERS
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        backgroundColor = .orange
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel?.numberOfLines = .zero
        titleLabel?.textAlignment = .center
    }
}
