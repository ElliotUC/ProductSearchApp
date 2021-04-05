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
    
    private var itemDetailResultViewModel: ItemDetailResultViewModel!
    private var sellerResultViewModel: SellerResultViewModel!
    
    private var itemViewModel: ItemViewModel!
    private var itemDetailViewModel: ItemDetailViewModel!
    private var sellerViewModel: SellerViewModel!
    
    @IBOutlet weak var horizontalScrollView: CarouselScrollView!
    @IBOutlet weak var conditionItem: UILabel!
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var priceItem: UILabel!
    @IBOutlet weak var itemRate: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var quantitySold: UILabel!
    @IBOutlet weak var quantityAvailable: UILabel!
    @IBOutlet weak var warranty: UILabel!
    @IBOutlet weak var sellerNickName: UILabel!
    
    static func instantiate(itemViewModel: ItemViewModel, itemDetailResultViewModel: ItemDetailResultViewModel, sellerResultViewModel: SellerResultViewModel
    ) -> ItemDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "detail") as! ItemDetailViewController
        viewController.itemViewModel = itemViewModel
        viewController.itemDetailResultViewModel = itemDetailResultViewModel
        viewController.sellerResultViewModel = sellerResultViewModel
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCarouselScrollView()
        setItemInformation(itemViewModel: itemViewModel)
        
        itemDetailResultViewModel.getItemDetailViewModel(itemId: itemViewModel.itemId)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] itemDetailViewModel in
                
                self?.itemDetailViewModel = itemDetailViewModel
                self?.setItemDetailInformation(itemDetailViewModel: itemDetailViewModel)
                self?.horizontalScrollView!.reloadData()
                
                self?.sellerResultViewModel.getSellerViewModel(sellerId: itemDetailViewModel.sellerId).observeOn(MainScheduler.instance).subscribe(onSuccess: { [weak self] sellerViewModel in
                    
                    self?.setSellerInformation(sellerViewModel: sellerViewModel)
                }, onError: { error in
                    print("Error on get seller: ", error.localizedDescription)
                }).disposed(by: self!.disposeBag)
            }, onError: { error in
                print("Error on get detail: ", error.localizedDescription)
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
    
    private func setItemDetailInformation(itemDetailViewModel: ItemDetailViewModel) {
        conditionItem.text = itemDetailViewModel.displayCondition
        quantityAvailable.text = itemDetailViewModel.displayAvailableQuantity
        quantitySold.text = itemDetailViewModel.displaySoldQuantity
        warranty.text = itemDetailViewModel.displayWarranty
    }
    
    private func setSellerInformation(sellerViewModel: SellerViewModel) {
        sellerNickName.text = sellerViewModel.displaySeller()
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
