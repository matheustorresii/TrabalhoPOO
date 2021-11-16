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
}
