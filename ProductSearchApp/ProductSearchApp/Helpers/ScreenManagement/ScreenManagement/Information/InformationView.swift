//
//  InformationView.swift
//  ProductSearchApp
//
//  Created by Elliot on 01-04-21.
//

import UIKit
import Lottie

class InformationView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
       super.awakeFromNib()
       setupAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    private func setupAnimation() {
        let animationView = AnimationView()
        animationView.animation = Animation.named("search-lottie")
        animationView.frame = containerView.bounds
        animationView.backgroundColor = UIColor(red: 0.95, green: 0.96, blue: 0.97, alpha: 1.00)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        containerView.addSubview(animationView)
    }
}
