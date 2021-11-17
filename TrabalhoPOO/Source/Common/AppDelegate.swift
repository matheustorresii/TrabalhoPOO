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
        registerUserDefaultKeys()
        createWindow()
        return true
    }
    
    private func createWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainFlowController = assembler.resolver.resolve(MainFlowControllerProtocol.self)!
        window?.rootViewController = mainFlowController
        window?.makeKeyAndVisible()
    }
    
    private func registerUserDefaultKeys() {
        if UserDefaults.standard.data(forKey: Entity.student.identifier) == nil {
            if let dataToSave = try? PropertyListEncoder().encode([Student]()) {
                UserDefaults.standard.set(dataToSave, forKey: Entity.student.identifier)
            }
        }
        
        if UserDefaults.standard.data(forKey: Entity.subject.identifier) == nil {
            if let dataToSave = try? PropertyListEncoder().encode([Subject]()) {
                UserDefaults.standard.set(dataToSave, forKey: Entity.subject.identifier)
            }
        }
        
        if UserDefaults.standard.data(forKey: Entity.course.identifier) == nil {
            if let dataToSave = try? PropertyListEncoder().encode([Course]()) {
                UserDefaults.standard.set(dataToSave, forKey: Entity.course.identifier)
            }
        }
    }
    
}

