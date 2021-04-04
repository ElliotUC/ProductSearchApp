//
//  ItemDetailViewController.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ItemDetailViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var coordinator: Coordinator!
    
    private var itemResultViewModel: ItemDetailResultViewModel!
    private var itemViewModel: ItemViewModel!
    private var itemDetailViewModel: ItemDetailViewModel!
    
    @IBOutlet weak var horizontalScrollView: CarouselScrollView!
    @IBOutlet weak var conditionItem: UILabel!
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var priceItem: UILabel!
    @IBOutlet weak var itemRate: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    
    static func instantiate(itemViewModel: ItemViewModel, itemResultViewModel: ItemDetailResultViewModel
    ) -> ItemDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as! ItemDetailViewController
        viewController.itemViewModel = itemViewModel
        viewController.itemResultViewModel = itemResultViewModel
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarouselScrollView()
        setItemInformation(itemViewModel: itemViewModel)
        
        itemResultViewModel.getItemDetailViewModel(itemId: itemViewModel.itemId)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] itemDetailViewModel in
                self?.itemDetailViewModel = itemDetailViewModel
                self?.horizontalScrollView!.reloadData()
            }, onError: { (error) in
                
            }).disposed(by: disposeBag)
    }
    
    private func configureCarouselScrollView() {
        horizontalScrollView!.carouselDataSource = self
        horizontalScrollView.showsHorizontalScrollIndicator = false
        horizontalScrollView.isPagingEnabled = true
    }
    
    private func setItemInformation(itemViewModel: ItemViewModel) {
        titleItem.text = itemViewModel.displayTitle
        priceItem.text = itemViewModel.displayPrice
        itemRate.text = itemViewModel.displayInstallments
        originalPrice.text = itemViewModel.displayOriginalPrice
        originalPrice.strikeThroughText()
    }
}

extension ItemDetailViewController: CarouselScrollViewDataSource {
    func numberOfImagesInSection() -> Int {
        return (itemDetailViewModel.displayImages.count)
    }
    
    func imageURLForSection(position: Int) -> URL {
        return (itemDetailViewModel.displayImages[position])
    }
}
