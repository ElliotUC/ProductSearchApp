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
    private var viewModel: ProductResultListViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: ProductResultListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchProductViewModel().bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayTitle
        }.disposed(by: disposeBag)
        
    }


}

