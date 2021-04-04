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
    
    private let disposeBag = DisposeBag()
    private let searchBar = UISearchBar()
    private var itemViewModel = [ProductViewModel]()
    
    private var coordinator: Coordinator?
    private var screenManagement: ScreenManagement!
    private var viewModel: ProductResultListViewModel!
    
    private var isSearching: Bool = false
    
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
        screenManagement = ScreenManagement(frame: self.view.bounds)
        screenManagement.showScreenView(type: .welcome)
        self.view.addSubview(screenManagement)
    }
    
    private func configureSearchBar() {
        searchBar.barStyle = .default
        searchBar.barTintColor = .white
        searchBar.rx.setDelegate(self).disposed(by: disposeBag)
        navigationItem.titleView = searchBar
    }
    
    private func reloadProductsData() {
        if self.itemViewModel.count <= 0 {self.screenManagement.showScreenView(type: .notFound)}
        self.tableView.reloadData()
        self.screenManagement.hideScreenView(type: .loading)
    }
    
    private func displayCells(searchItems by: String, offset: Int = 0, isNewSearch: Bool = true) {
        self.isSearching = true
        viewModel.fetchProductViewModel(searchItems: by, offset: offset)
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] (productViewModel) in
                if (isNewSearch) {
                    self?.itemViewModel = productViewModel
                } else {
                    self?.itemViewModel.append(contentsOf: productViewModel)
                }
                self?.reloadProductsData()
                self?.isSearching = false
            }, onError: { (error) in
                
            })        
            .disposed(by: disposeBag)
    }
}

//MARK: UITableView delegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListProductCell.self), for: indexPath) as! ListProductCell
        
        let viewModel = itemViewModel[indexPath.row]
        cell.bind(viewModel: viewModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = itemViewModel[indexPath.row]
        coordinator?.showItemDetail(productviewModel: viewModel)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 20 == itemViewModel.count {
            if(self.isSearching == false) {
                print("Searching...")
                self.displayCells(searchItems: searchBar.text ?? "", offset: itemViewModel.count, isNewSearch: false)
            }
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.screenManagement.hideScreenViews()
        self.screenManagement.showScreenView(type: .loading)
        self.displayCells(searchItems: searchBar.text ?? "")
    }
}
