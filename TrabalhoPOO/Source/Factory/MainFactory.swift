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
}
