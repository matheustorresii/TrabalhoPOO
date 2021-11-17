//
//  ItemViewModelProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

protocol ItemViewModelProtocol: AnyObject {
    func getEntity() -> Entity
    func getItem() -> Item?
    func add(student: Student)
    func add(subject: Subject)
    func add(course: Course)
}
