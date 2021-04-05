//
//  ItemViewController.swift
//  ProductSearchApp
//
//  Created by Elliot on 29-03-21.
//

import UIKit
import RxSwift
import RxCocoa

class ItemViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let searchBar = UISearchBar()
    private var itemsViewModel = [ItemViewModel]()
    
    private var coordinator: Coordinator?
    private var screenManagement: ScreenManagement!
    private var viewModel: ItemResultListViewModel!
    
    private var isSearching: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: ItemResultListViewModel, coordinator: Coordinator) -> ItemViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ItemViewController
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
        screenManagement = ScreenManagement(frame: self.view.bounds)
        screenManagement.showScreenView(type: .welcome)
        self.view.addSubViewInBackgroundThread(view: screenManagement)
    }
    
    private func configureSearchBar() {
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.minimumFontSize = 10
            
            let backgroundView = textField.subviews.first
            if #available(iOS 11.0, *) {
                backgroundView?.backgroundColor = .white
            }
        }
        
        searchBar.barStyle = .default
        searchBar.barTintColor = .white
        searchBar.placeholder = "Buscar en Mercado Libre"
        navigationItem.titleView = searchBar
        searchBar.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    private func reloadProductsData() {
        if self.itemsViewModel.count <= 0 {self.screenManagement.showScreenView(type: .notFound)}
        self.tableView.reloadData()
        self.screenManagement.hideScreenView(type: .loading)
    }
    
    private func displayCells(searchItems by: String, offset: Int = 0, isNewSearch: Bool = true) {
        self.isSearching = true
        viewModel.fetchItemsViewModel(searchItems: by, offset: offset)
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] itemsViewModel in
                
                if (isNewSearch) {
                    self?.itemsViewModel = itemsViewModel
                } else {
                    self?.itemsViewModel.append(contentsOf: itemsViewModel)
                }
                self?.reloadProductsData()
                self?.isSearching = false
            }, onError: { (error) in
                print("Error on fetch items: ", error.localizedDescription)
            })        
            .disposed(by: disposeBag)
    }
}

extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListProductCell.self), for: indexPath) as! ListProductCell
        
        let viewModel = itemsViewModel[indexPath.row]
        cell.bind(viewModel: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemViewModel = itemsViewModel[indexPath.row]
        coordinator?.showItemDetail(itemviewModel: itemViewModel)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 20 == itemsViewModel.count {
            if(self.isSearching == false) {
                print("Searching...")
                self.displayCells(searchItems: searchBar.text ?? "", offset: itemsViewModel.count, isNewSearch: false)
            }
        }
    }
}

extension ItemViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.screenManagement.hideScreenViews()
        self.screenManagement.showScreenView(type: .loading)
        self.displayCells(searchItems: searchBar.text ?? "")
    }
}
