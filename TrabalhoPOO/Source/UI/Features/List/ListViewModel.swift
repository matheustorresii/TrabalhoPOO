//
//  ListViewModel.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 16/11/21.
//

import Foundation

class ListViewModel: ListViewModelProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let model: ListModel
    private lazy var items: [Item] = {
        return UserDefaults.standard.value(forKey: model.type.identifier) as? [Item] ?? []
    }()
    
    // MARK: - INITIALIZERS
    
    init(model: ListModel) {
        self.model = model
    }
    
    // MARK: - PUBLIC METHODS
    
    func getEntity() -> Entity {
        return model.type
    }
    
    func getItems() -> [Item] {
        return items
    }
    
}
