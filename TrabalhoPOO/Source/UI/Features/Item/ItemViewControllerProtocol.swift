//
//  ItemViewControllerProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

protocol ItemViewControllerProtocol: UIViewController {
    var delegate: ItemViewControllerDelegate? { get set }
}
