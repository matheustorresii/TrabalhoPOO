//
//  ItemModel.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import Foundation

struct ItemModel {
    enum ItemOrigin {
        case new
        case existent(item: Item)
    }
    
    let itemOrigin: ItemOrigin
    let entity: Entity
}
