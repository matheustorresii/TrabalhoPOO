//
//  ListViewControllerProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 16/11/21.
//

import UIKit

protocol ListViewControllerProtocol: UIViewController {
    var delegate: ListViewControllerDelegate? { get set }
}
