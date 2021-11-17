//
//  TwoViewModel.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

class TwoViewModel: TwoViewModelProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let model: TwoModel
    
    // MARK: - INITIALIZERS
    
    init(model: TwoModel) {
        self.model = model
    }
    
    // MARK: - PUBLIC METHODS
    
    func start() -> String {
        let client = Client(name: "Matheus Torres")
        let anotherClient = Client(name: "Heitor Moreira")
        
        let two = TWO()
        let strings = [
            // 1
            two.createAccountTo(client: client),
            two.createAccountTo(client: anotherClient),
            
            // 2
            two.withdraw(value: 10, from: client),
            
            // 3
            two.deposit(value: 15, to: client),
            
            // 4
            two.verify(client: anotherClient),
            
            // 5
            two.transfer(value: 5, from: client, to: anotherClient),
            
            // Verify both accounts
            two.verify(client: client),
            two.verify(client: anotherClient)
        ]
        
        return strings.joined(separator: "\n\n")
    }
}
