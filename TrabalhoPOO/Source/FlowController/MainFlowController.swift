//
//  MainFlowController.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import UIKit

class MainFlowController: UIViewController, MainFlowControllerProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let flowNavigationController = UINavigationController()
    private let factory: MainFactoryProtocol
    
    // MARK: - INITIALIZERS
    
    init(factory: MainFactoryProtocol) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .white
        flowNavigationController.setViewControllers([homeViewController()], animated: true)
        add(flowNavigationController)
    }
    
    private func homeViewController() -> UIViewController {
        return factory.makeHomeViewController(model: HomeModel())
    }
}
