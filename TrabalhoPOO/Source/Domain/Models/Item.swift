//
//  Item.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

protocol Item { }

struct Student: Item {
    let name: String
    let age: Int
    let course: Course
}

struct Subject: Item {
    enum Shift: String {
        case morning = "Manhã"
        case evening = "Tarde"
        case night = "Noturno"
    }
    
    let name: String
    let shift: Shift
}

struct Course: Item {
    let name: String
    let grade: Double
    let subjects: [Subject]
}
