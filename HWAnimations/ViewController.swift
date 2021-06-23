//
//  ViewController.swift
//  HWAnimations
//
//  Created by Алексей on 22.06.2021.
//

import UIKit
import Spring


class ViewController: UIViewController {
    @IBOutlet weak var animatedView: SpringView!
    @IBOutlet weak var nameAnimationLabel: UILabel!
    @IBOutlet weak var animationButton: SpringButton!
    
    let duartion: CGFloat = 1.0
    let delay: CGFloat = 0.5
    
    let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
    ]
    
    private var currentAnimation = 0
    private var nextAnimation = 1
    
    override func viewDidLoad() {
        animatedView.layer.cornerRadius = 15
        animationButton.layer.cornerRadius = 15
    }
    
    @IBAction func pressedButton(_ sender: Any) {
        nameAnimationLabel.text = animations[currentAnimation].rawValue
        
        animateView()
        
        currentAnimation += 1
        nextAnimation = currentAnimation

        if animations.count == currentAnimation {
            currentAnimation = 0
            nextAnimation = 1
        }

        animationButton.setTitle(animations[nextAnimation].rawValue, for: .normal)
    }
    
    private func animateView() {
        animatedView.animation = animations[currentAnimation].rawValue
        
        animatedView.duration = duartion
        animatedView.delay = delay
        
        animatedView.animate()
    }
}

