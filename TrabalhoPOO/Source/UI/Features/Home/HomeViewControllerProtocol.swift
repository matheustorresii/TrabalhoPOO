//
//  HomeViewControllerProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import UIKit

protocol HomeViewControllerProtocol: UIViewController {
    var delegate: HomeViewControllerDelegate? { get set }
}
