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
        createViewHierarchy()
    }
    
    private func createViewHierarchy() {
        
    }
}
