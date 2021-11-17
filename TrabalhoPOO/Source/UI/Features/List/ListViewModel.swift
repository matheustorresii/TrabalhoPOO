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
    
    // MARK: - INITIALIZERS
    
    init(model: ListModel) {
        self.model = model
    }
    
    // MARK: - PUBLIC METHODS
    
    func getEntity() -> Entity {
        return model.type
    }
    
    func getItems() -> [Item] {
        return getItemsFromUserDefaults()
    }
    
    // MARK: - PRIVATE METHODS
    
    private func getItemsFromUserDefaults() -> [Item] {
        guard let savedData = UserDefaults.standard.data(forKey: model.type.identifier) else { return [] }
        switch model.type {
        case .student: return getStudents(with: savedData)
        case .subject: return getSubjects(with: savedData)
        case .course: return getCourses(with: savedData)
        }
    }
    
    private func getStudents(with data: Data) -> [Student] {
        (try? PropertyListDecoder().decode([Student].self, from: data)) ?? []
    }
    
    private func getSubjects(with data: Data) -> [Subject] {
        (try? PropertyListDecoder().decode([Subject].self, from: data)) ?? []
    }
    
    private func getCourses(with data: Data) -> [Course] {
        (try? PropertyListDecoder().decode([Course].self, from: data)) ?? []
    }
}
