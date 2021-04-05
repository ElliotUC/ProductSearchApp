//
//  LoadingView.swift
//  ProductSearchApp
//
//  Created by Elliot on 31-03-21.
//

import UIKit
import Lottie

class LoadingView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    var animationView: AnimationView!
    
    override func awakeFromNib() {
       super.awakeFromNib()
       setupAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
     func setupAnimation() {
        let animationView = AnimationView()
        animationView.animation = Animation.named("lottie-loading3")
        animationView.frame = containerView.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        containerView.addSubViewInBackgroundThread(view: animationView)
    }
}
