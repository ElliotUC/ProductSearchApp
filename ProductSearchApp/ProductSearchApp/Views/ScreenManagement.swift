//
//  ScreenManagement.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import Foundation
import UIKit

enum ScreenManagementType {
    case loading
    case internet
    case noFound
}

class ScreenManagement {
    
    let view: UIView
    var loadingView: LoadingView?
    
    init(view: UIView) {
        self.view = view
    }
    
    func showScreenView(type: ScreenManagementType) {
        let screenview = getScreenView(type: type)
        easyIn(screenView: screenview)
    }
    
    func hideScreenView(type: ScreenManagementType) {
        let screenview = getScreenView(type: type)
        easyOut(screenView: screenview)
    }
    
    private func getScreenView(type: ScreenManagementType) -> UIView{
        switch type {
        case .loading:
            if let loading = loadingView {
                return loading
            } else {
                loadingView = LoadingView(frame: view.bounds)
                view.addSubviewMainThreadSecure(view: loadingView!)
                return loadingView!
            }
        case .internet:
            if let loading = loadingView {
                return loading
            } else {
                loadingView = LoadingView(frame: view.bounds)
                view.addSubviewMainThreadSecure(view: loadingView!)
                return loadingView!
            }
        case .noFound:
            if let loading = loadingView {
                return loading
            } else {
                loadingView = LoadingView(frame: view.bounds)
                view.addSubviewMainThreadSecure(view: loadingView!)
                return loadingView!
            }
        }
    }
    
    private func easyIn(screenView: UIView) {
        screenView.isHidden = false
        screenView.alpha = 0.0
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            screenView.alpha = 1.0
        }, completion: nil)
    }
    
    private func easyOut(screenView: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut) {
            screenView.alpha = 0.0
        } completion: { (completion) in
            screenView.isHidden = true
        }
    }
}
