//
//  MainAssembly.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation
import Swinject

class MainAssembly: Assembly {
    func assemble(container: Container) {
        registerFactory(container)
        registerFlowController(container)
        registerHomeViewController(container)
        registerListViewController(container)
        registerItemViewController(container)
        registerTwoViewController(container)
    }
    
    // MARK: - FACTORY
    
    private func registerFactory(_ container: Container) {
        container.register(MainFactoryProtocol.self) { resolver in
            return MainFactory(resolver: resolver)
        }
    }
    
    // MARK: - FLOW CONTROLLER
    
    private func registerFlowController(_ container: Container) {
        container.register(MainFlowControllerProtocol.self) { resolver in
            let factory = resolver.resolve(MainFactoryProtocol.self)!
            return MainFlowController(factory: factory)
        }
    }
    
    // MARK: - VIEW CONTROLLERS
    
    private func registerHomeViewController(_ container: Container) {
        container.register(HomeViewModelProtocol.self) { (resolver, model: HomeModel) in
            return HomeViewModel(model: model)
        }
        
        container.register(HomeViewControllerProtocol.self) { (resolver, model: HomeModel) in
            let viewModel = resolver.resolve(HomeViewModelProtocol.self, argument: model)!
            return HomeViewController(viewModel: viewModel)
        }
    }
    
    private func registerListViewController(_ container: Container) {
        container.register(ListViewModelProtocol.self) { (resolver, model: ListModel) in
            return ListViewModel(model: model)
        }
        
        container.register(ListViewControllerProtocol.self) { (resolver, model: ListModel) in
            let viewModel = resolver.resolve(ListViewModelProtocol.self, argument: model)!
            return ListViewController(viewModel: viewModel)
        }
    }
    
    private func registerItemViewController(_ container: Container) {
        container.register(ItemViewModelProtocol.self) { (resolver, model: ItemModel) in
            return ItemViewModel(model: model)
        }
        
        container.register(ItemViewControllerProtocol.self) { (resolver, model: ItemModel) in
            let viewModel = resolver.resolve(ItemViewModelProtocol.self, argument: model)!
            return ItemViewController(viewModel: viewModel)
        }
    }
    
    private func registerTwoViewController(_ container: Container) {
        container.register(TwoViewModelProtocol.self) { (resolver, model: TwoModel) in
            return TwoViewModel(model: model)
        }
        
        container.register(TwoViewControllerProtocol.self) { (resolver, model: TwoModel) in
            let viewModel = resolver.resolve(TwoViewModelProtocol.self, argument: model)!
            return TwoViewController(viewModel: viewModel)
        }
    }
}
