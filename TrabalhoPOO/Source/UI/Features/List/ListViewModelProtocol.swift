//
//  ListViewModelProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 16/11/21.
//

import Foundation

protocol ListViewModelProtocol: AnyObject {
    func getEntity() -> Entity
    func getItems() -> [Item]
}
