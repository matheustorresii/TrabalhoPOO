//
//  Collection+Extensions.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
