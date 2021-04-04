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
    func showItemDetail(productviewModel: ProductViewModel)
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
        let viewController = ViewController.instantiate(
            viewModel: ProductResultListViewModel(
                productResultService: ProductResultService(
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
    
    func showItemDetail(productviewModel: ProductViewModel) {
        let viewController = DetailProductViewController.instantiate(productViewModel: productviewModel, itemResultViewModel: ItemResultViewModel(detailItemService: DetailItemService(apiClient: apiClient)))
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
