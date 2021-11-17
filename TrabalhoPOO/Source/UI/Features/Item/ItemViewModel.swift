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
    
    // MARK: - PUBLIC METHODS
    
    func getEntity() -> Entity {
        model.entity
    }
    
    func getItem() -> Item? {
        model.item
    }
    
    func add(student: Student) {
        guard let savedData = UserDefaults.standard.data(forKey: Entity.student.identifier),
              var students = try? PropertyListDecoder().decode([Student].self, from: savedData) else { return }
        students.append(student)
        if let dataToSave = try? PropertyListEncoder().encode(students) {
            UserDefaults.standard.set(dataToSave, forKey: Entity.student.identifier)
        }
    }
    
    func add(subject: Subject) {
        guard let savedData = UserDefaults.standard.data(forKey: Entity.subject.identifier),
              var subjects = try? PropertyListDecoder().decode([Subject].self, from: savedData) else { return }
        subjects.append(subject)
        if let dataToSave = try? PropertyListEncoder().encode(subjects) {
            UserDefaults.standard.set(dataToSave, forKey: Entity.subject.identifier)
        }
    }
    
    func add(course: Course) {
        guard let savedData = UserDefaults.standard.data(forKey: Entity.course.identifier),
              var courses = try? PropertyListDecoder().decode([Course].self, from: savedData) else { return }
        courses.append(course)
        if let dataToSave = try? PropertyListEncoder().encode(courses) {
            UserDefaults.standard.set(dataToSave, forKey: Entity.course.identifier)
        }
    }
}
