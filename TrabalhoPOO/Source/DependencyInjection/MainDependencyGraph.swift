//
//  MainDependencyGraph.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation
import Swinject

class MainDependencyGraph {
    static func build() -> [Assembly] {
        return [MainAssembly()]
    }
}
