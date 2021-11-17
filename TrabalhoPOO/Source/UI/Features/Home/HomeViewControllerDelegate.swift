//
//  HomeViewControllerDelegate.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation

protocol HomeViewControllerDelegate: AnyObject {
    func navigateToList(type: Entity)
    func navigateToTwo()
}
