//
//  Item.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

protocol Item: Codable {
    var name: String { get }
}

extension Item where Self: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Student: Item {
    let name: String
    let age: Int
    let course: Course
}

struct Subject: Item {
    enum Shift: Int, CaseIterable, Codable {
        case morning
        case evening
        case night
        
        var description: String {
            switch self {
            case .morning: return "Manhã"
            case .evening: return "Tarde"
            case .night:   return "Noturno"
            }
        }
    }
    
    let name: String
    let shift: Shift
}

struct Course: Item {
    let name: String
    let grade: Double
    let subject: Subject
}
