//
//  ListViewControllerDelegate.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 16/11/21.
//

import Foundation

protocol ListViewControllerDelegate: AnyObject {
    func navigateToAddNewItem(with entity: Entity)
    func navigateToEdit(item: Item, with entity: Entity)
}
