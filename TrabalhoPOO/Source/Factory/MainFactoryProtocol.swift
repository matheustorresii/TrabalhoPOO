//
//  MainFactoryProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation

protocol MainFactoryProtocol {
    func makeHomeViewController(model: HomeModel) -> HomeViewControllerProtocol
    func makeListViewController(model: ListModel) -> ListViewControllerProtocol
    func makeItemViewController(model: ItemModel) -> ItemViewControllerProtocol
    func makeTwoViewController(model: TwoModel) -> TwoViewControllerProtocol
}
