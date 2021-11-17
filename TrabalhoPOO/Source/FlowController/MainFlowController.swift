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
        let homeViewController = factory.makeHomeViewController(model: HomeModel())
        homeViewController.delegate = self
        return homeViewController
    }
    
    private func listViewController(model: ListModel) -> UIViewController {
        let listViewController = factory.makeListViewController(model: model)
        listViewController.delegate = self
        return listViewController
    }
    
    private func itemViewController(model: ItemModel) -> UIViewController {
        let itemViewController = factory.makeItemViewController(model: model)
        itemViewController.delegate = self
        return itemViewController
    }
}

// MARK: - HomeViewControllerDelegate

extension MainFlowController: HomeViewControllerDelegate {
    func navigateToList(type: Entity) {
        let listViewController = listViewController(model: ListModel(type: type))
        flowNavigationController.pushViewController(listViewController, animated: true)
    }
}

// MARK: - ListViewControllerDelegate

extension MainFlowController: ListViewControllerDelegate {
    func navigateToAddNewItem(with entity: Entity) {
        let itemViewController = itemViewController(model: ItemModel(entity: entity, item: nil))
        flowNavigationController.pushViewController(itemViewController, animated: true)
    }
    
    func navigateToEdit(item: Item, with entity: Entity) {
        let itemViewController = itemViewController(model: ItemModel(entity: entity, item: item))
        flowNavigationController.pushViewController(itemViewController, animated: true)
    }
}

// MARK: - ItemViewControllerDelegate

extension MainFlowController: ItemViewControllerDelegate {
    func navigateBack() {
        flowNavigationController.popViewController(animated: true)
    }
}
