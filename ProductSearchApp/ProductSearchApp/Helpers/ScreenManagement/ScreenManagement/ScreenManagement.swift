//
//  ScreenManagement.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import UIKit

enum ScreenManagementType {
    case welcome
    case loading
    case internet
    case notFound
}

class ScreenManagement: UIView {

    private lazy var loadingView: LoadingView = {
        let loading: LoadingView = .fromNib()
        loading.frame = self.bounds
        self.addSubview(loading)
        return loading
    }()
    
    private lazy var welcomeView: InformationView = {
        let welcome: InformationView = .fromNib()
        welcome.frame = self.bounds
        self.addSubview(welcome)
        return welcome
    }()
    
    private lazy var notFoundView: InformationView = {
        let notFound: InformationView = .fromNib()
        notFound.frame = self.bounds
        notFound.title.text = "No encontramos publicaciones"
        notFound.message.text = "Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales."
        self.addSubview(notFound)
        return notFound
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showScreenView(type: ScreenManagementType) {
        let screenview = getScreenView(type: type)
        easyIn(screenView: screenview)
    }
    
    func hideScreenView(type: ScreenManagementType) {
        let screenview = getScreenView(type: type)
        easyOut(screenView: screenview)
    }
    
    func hideScreenViews() {
        _ = self.subviews.map {
            if $0.isKind(of: LoadingView.self) || $0.isKind(of: InformationView.self) {
                easyOut(screenView: $0)
            }
        }
    }
    
    private func getScreenView(type: ScreenManagementType) -> UIView {
        switch type {
        case .welcome:
            return welcomeView
        case .loading:
            return loadingView
        case .internet:
            return loadingView
        case .notFound:
            return notFoundView
        }
    }


    private func easyIn(screenView: UIView) {
        screenView.alpha = 0.0
        UIView.animate(withDuration: 0.3, delay: 0.3, options:
                        .curveEaseIn, animations: {
                            screenView.alpha = 1.0
                        }, completion: nil)
    }
    
    private func easyOut(screenView: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options:
                        .curveEaseOut, animations: {
                            screenView.alpha = 0.0
                        }, completion: {_ in self.isUserInteractionEnabled = false})
    }
}
