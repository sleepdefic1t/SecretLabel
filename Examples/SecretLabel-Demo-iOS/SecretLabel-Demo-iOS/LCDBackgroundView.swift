//
//  LCDBackgroundView.swift
//  SecretLabel-Demo-iOS
//
//  Created by SleepDefic1t on 10/26/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//

import UIKit

class LCDBackgroundView: UIView {
    
    
    /*
     ====================================================================================================
     -  Gradient Layer Overlay
     ====================================================================================================
     -  gradientColors Array steps from color1 to color2, then back to color1
     */
    
    let gradientColor1: CGColor = UIColor(red: 0.417, green: 0.419, blue: 0.172, alpha:0.45).cgColor
    let gradientColor2: CGColor = UIColor(red: 0.329, green: 0.38, blue: 0.14, alpha:0.8).cgColor

    var gradientColors: [CGColor] { return [gradientColor1, gradientColor2, gradientColor1] }
    
    let gradient1: CAGradientLayer = CAGradientLayer()
    let gradient2: CAGradientLayer = CAGradientLayer()
    
    
    
    /*
     ====================================================================================================
     -  Blur Effect Overlay
     ====================================================================================================
     */
    
    let blurView = UIVisualEffectView(
        effect: UIBlurEffect(
            style: UIBlurEffectStyle.light
        )
    )
    


    /*
     ====================================================================================================
     -  View LifeCycle
     ====================================================================================================
     -  Loads Parameters after view moves to window.
     */
    
    override func didMoveToWindow() {
        
        autoresizingMask = UIViewAutoresizing.flexibleWidth.union(.flexibleHeight)
        backgroundColor = .clear
        
        
        /*
         ==================================================
         -  Gradient: Parameters
         ==================================================
         -  Sets Start & End-Points for gradient1 & gradient2
         -  'For-Loop': There's no sense in writing identical properties twice. 6-lines > 8-lines
         */
        
        gradient1.startPoint = CGPoint(x: 0.0, y: 1.0) // bottom-left
        gradient1.endPoint = CGPoint(x: 1.0, y: 0.0) // top-right
        
        gradient2.startPoint = CGPoint(x: 0.0, y: 0.0) // top-left
        gradient2.endPoint = CGPoint(x: 1.0, y: 1.0) // bottom-right
        
        for gradient in [gradient1, gradient2] {
            
            gradient.colors = gradientColors
            gradient.locations = [0.2, 0.5, 0.8]
            gradient.frame = self.frame
            self.layer.addSublayer(gradient)
            
        }
        
        
        /*
         ==================================================
         -  Blur: Parameters
         ==================================================
         -  Sets blurView frame & autoresizing mask
         */
        
        blurView.frame = self.frame
        blurView.autoresizingMask = self.autoresizingMask

        addSubview(blurView)

    }

    
    override func layoutSubviews() {
        
        /*
         ==================================================
         - Layout Change Detect: Screen Rotation, etc.
         ==================================================
         -  Guard-Checks for sublayers at layout-change;
         -  Sets layer frames to self.frame
         */
        
        guard let sublayers = self.layer.sublayers else { return }
        
        for layer in sublayers {
            
            layer.frame = self.frame
            
        }
        
    }


}
