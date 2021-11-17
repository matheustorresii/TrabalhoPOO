//
//  ItemViewModel.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

class ItemViewModel: ItemViewModelProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let model: ItemModel
    
    // MARK: - INITIALIZERS
    
    init(model: ItemModel) {
        self.model = model
    }
}
