//
//  ViewController.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let searchBar = UISearchBar()
    var dataSource = [ProductViewModel]()
    
    private var coordinator: Coordinator?
    private var screenManagement: ScreenManagement!
    private var viewModel: ProductResultListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: ProductResultListViewModel, coordinator: Coordinator) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        viewController.coordinator = coordinator
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        configureScreenManagement()
    }
    
    private func configureScreenManagement() {
        screenManagement = ScreenManagement(view: self.view)
        //screenManagement.showScreenView(type: .loading)
    }
    
    private func configureSearchBar() {
        searchBar.barStyle = .default
        searchBar.rx.setDelegate(self).disposed(by: disposeBag)
        navigationItem.titleView = searchBar
    }
    
    private func reloadProductsData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.screenManagement.hideScreenView(type: .loading)
        }
    }
    
    private func displayCells(searchProductsBy: String) {
        viewModel.fetchProductViewModel(searchProductsBy: searchProductsBy)
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [self] productViewModel in
                self.dataSource = productViewModel
                reloadProductsData()
            }, onError: { error in
            }, onCompleted: {
            }).disposed(by: disposeBag)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListProductCell.self), for: indexPath) as! ListProductCell
        
        let viewModel = dataSource[indexPath.row]
        
        cell.productImage.downloaded(from: viewModel.displayImageUrl!)
        cell.productName.text = viewModel.displayTitle
        cell.productPrice.text = viewModel.displayPrice
        cell.productRate.text = viewModel.displayInstallments
        cell.shipping.text = viewModel.displayShipping
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        screenManagement.showScreenView(type: .loading)
        displayCells(searchProductsBy: searchBar.text ?? "")
    }
}
