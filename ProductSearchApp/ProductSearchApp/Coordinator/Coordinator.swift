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
    func showItemDetail(itemviewModel: ItemViewModel)
}

class MainCoordinator: Coordinator {
    
    private let window: UIWindow
    private let apiClient: APIClient
    var navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        self.apiClient = APIClient()
    }
    
    func start() {
        let viewController = ItemViewController.instantiate(
            viewModel: ItemResultListViewModel(
                itemResultService: ItemResultService(
                    apiClient: apiClient
                )
            ),
            coordinator: self
        )
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.barTintColor = .meliYellow
        navigationController.navigationBar.tintColor = .meliBlackTranslucent
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showItemDetail(itemviewModel: ItemViewModel) {
        let viewController = ItemDetailViewController.instantiate(itemViewModel: itemviewModel, itemResultViewModel: ItemDetailResultViewModel(itemDetailService: ItemDetailService(apiClient: apiClient)))
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
