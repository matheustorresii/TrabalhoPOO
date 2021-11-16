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
        print("HOME")
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .white
        createViewHierarchy()
    }
    
    private func createViewHierarchy() {
        
    }
}
