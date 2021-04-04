//
//  DetailProductViewController.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class DetailProductViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var coordinator: Coordinator!
    
    private var itemResultViewModel: ItemResultViewModel!
    private var productViewModel: ProductViewModel!
    private var itemViewModel: ItemViewModel!
    
    @IBOutlet weak var horizontalScrollView: CarouselScrollView!
    @IBOutlet weak var conditionItem: UILabel!
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var priceItem: UILabel!
    @IBOutlet weak var itemRate: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    
    static func instantiate(productViewModel: ProductViewModel, itemResultViewModel: ItemResultViewModel
    ) -> DetailProductViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailProductViewController
        viewController.productViewModel = productViewModel
        viewController.itemResultViewModel = itemResultViewModel
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarouselScrollView()
        setItemInformation(productViewModel: productViewModel)
        
        itemResultViewModel.getItemViewModel(itemId: productViewModel.itemId)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] itemViewModel in
                self?.itemViewModel = itemViewModel
                self?.horizontalScrollView!.reloadData()
            }, onError: { (error) in
                
            }).disposed(by: disposeBag)
    }
    
    private func configureCarouselScrollView() {
        horizontalScrollView!.carouselDataSource = self
        horizontalScrollView.showsHorizontalScrollIndicator = false
        horizontalScrollView.isPagingEnabled = true
    }
    
    private func setItemInformation(productViewModel: ProductViewModel) {
        titleItem.text = productViewModel.displayTitle
        priceItem.text = productViewModel.displayPrice
        itemRate.text = productViewModel.displayInstallments
        originalPrice.text = productViewModel.displayOriginalPrice
        originalPrice.strikeThroughText()
    }
}

extension DetailProductViewController: CarouselScrollViewDataSource {
    func numberOfImagesInSection() -> Int {
        return (itemViewModel.displayImages.count)
    }
    
    func imageURLForSection(position: Int) -> URL {
        return (itemViewModel.displayImages[position])
    }
}
