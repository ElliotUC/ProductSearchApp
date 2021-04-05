//
//  SceneDelegate.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        coordinator = MainCoordinator(window: window)
        coordinator?.start()
    }
}

