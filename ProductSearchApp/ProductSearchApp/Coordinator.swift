//
//  Coordinator.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import Foundation
import UIKit

class Coordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiate(viewModel: ProductResultListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}


