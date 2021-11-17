//
//  MainFactory.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation
import Swinject

class MainFactory: MainFactoryProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let resolver: Resolver
    
    // MARK: - INITIALIZERS
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    // MARK: - PUBLIC METHODS
    
    func makeHomeViewController(model: HomeModel) -> HomeViewControllerProtocol {
        return resolver.resolve(HomeViewControllerProtocol.self, argument: model)!
    }
    
    func makeListViewController(model: ListModel) -> ListViewControllerProtocol {
        return resolver.resolve(ListViewControllerProtocol.self, argument: model)!
    }
    
    func makeItemViewController(model: ItemModel) -> ItemViewControllerProtocol {
        return resolver.resolve(ItemViewControllerProtocol.self, argument: model)!
    }
    
    func makeTwoViewController(model: TwoModel) -> TwoViewControllerProtocol {
        return resolver.resolve(TwoViewControllerProtocol.self, argument: model)!
    }
}
