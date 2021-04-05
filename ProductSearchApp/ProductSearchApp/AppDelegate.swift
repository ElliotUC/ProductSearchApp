//
//  AppDelegate.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = MainCoordinator(window: window!)
        coordinator?.start()
        
        return true
    }
}

