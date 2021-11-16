//
//  HomeViewModelProtocol.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import Foundation
import RxSwift

protocol HomeViewModelProtocol: AnyObject {
    var viewState: BehaviorSubject<HomeViewState> { get set }
}
