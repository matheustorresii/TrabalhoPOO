//
//  HomeViewModel.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let model: HomeModel
    
    // MARK: - INITIALIZERS
    
    init(model: HomeModel) {
        self.model = model
    }
}
