//
//  HomeViewModel.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation
import RxSwift

class HomeViewModel: HomeViewModelProtocol {
    // MARK: - PUBLIC PROPERTIES
    
    var viewState: BehaviorSubject<HomeViewState> = .init(value: .ready)
    
    // MARK: - PRIVATE PROPERTIES
    
    private let model: HomeModel
    
    // MARK: - INITIALIZERS
    
    init(model: HomeModel) {
        self.model = model
    }
}
