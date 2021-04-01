//
//  Coordinator.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

class MainCoordinator: Coordinator {
    
    private let window: UIWindow
    private let apiClient: APIClient
    
    init(window: UIWindow) {
        self.window = window
        self.apiClient = APIClient()
    }
    
    func start() {
        let viewController = ViewController.instantiate(
            viewModel: ProductResultListViewModel(
                productResultService: ProductResultService(
                    apiClient: apiClient
                )
            ),
            coordinator: self
        )
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.barTintColor = .yellow
        navigationController.navigationBar.tintColor = .white
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

protocol SearchCoordinator: Coordinator {
    
}

protocol ListCoordinator: Coordinator {
    
}

protocol ItemCoordinator: Coordinator {
    
}
