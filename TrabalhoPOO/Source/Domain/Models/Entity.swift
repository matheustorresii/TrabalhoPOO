//
//  Entity.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 16/11/21.
//

import Foundation

enum Entity {
    case student
    case subject
    case course
    
    var identifier: String {
        switch self {
        case .student: return "ALUNOS"
        case .subject: return "DISCIPLINAS"
        case .course: return "CURSOS"
        }
    }
}
