//
//  TwoViewControllerProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 17/11/21.
//

import UIKit

protocol TwoViewControllerProtocol: UIViewController {
    var delegate: TwoViewControllerDelegate? { get set }
}
