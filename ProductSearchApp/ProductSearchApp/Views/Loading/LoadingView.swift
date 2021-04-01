//
//  LoadingView.swift
//  ProductSearchApp
//
//  Created by Elliot on 31-03-21.
//

import UIKit
import Lottie

class LoadingView: UIView {
    
    private var animationView: AnimationView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1.00)
        setupAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupAnimation() {
        let calculateRect = CGRect(x: (self.bounds.width - 100) / 2, y: (self.bounds.height - 100) / 2, width: 100, height: 100)
        
        let animationView = AnimationView()
        animationView.animation = Animation.named("lottie-loading3")
        animationView.frame = calculateRect
        animationView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1.00)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        self.addSubview(animationView)
    }
}
