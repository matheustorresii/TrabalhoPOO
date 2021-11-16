//
//  AppDelegate.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 08/11/21.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - UIApplicationDelegate
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        launch()
    }
    
    // MARK: - PRIVATE PROPERTIES
    
    private lazy var assembler: Assembler = {
        var assemblies = [Assembly]()
        assemblies.append(contentsOf: MainDependencyGraph.build())
        return Assembler(assemblies)
    }()
    
    // MARK: - PRIVATE METHODS
    
    private func launch() -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainFlowController = assembler.resolver.resolve(MainFlowControllerProtocol.self)!
        window?.rootViewController = mainFlowController
        window?.makeKeyAndVisible()
        return true
    }
    
}

