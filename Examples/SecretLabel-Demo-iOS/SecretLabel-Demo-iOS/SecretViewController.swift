//
//  SecretViewController.swift
//  SecretLabel-Demo-iOS
//
//  Created by SleepDefic1t on 10/19/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//

import UIKit
import SDGSecretLabel

class SecretViewController: UIViewController {
    
    
    var secretLabel: SDGSecretLabel = SDGSecretLabel()
    
    var secretController: SDGSecretController { return SDGSecretController(for: self.secretLabel) }
    
    var lcdBackgroundView: LCDBackgroundView { return LCDBackgroundView(frame: self.view.frame) }
    
    
    override func updateViewConstraints() {
        Swift.print("update")
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame = UIScreen.main.bounds
        
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(.flexibleHeight)

        view.addSubview(lcdBackgroundView)
        
        view.addSubview(secretLabel.presenting)
        
        
        /*  Welcome Animation   */
        "Welcome".start(.whispering,
                        using: self.secretController,
                        newFont: .systemFont(ofSize: 75, weight: UIFontWeightBold),
                        newAlignment: .center,
                        reverses: (true, delay: 0)) {
        
            "touch to begin".start(.whispering,
                                   using: self.secretController,
                                   newFont: .systemFont(ofSize: 50, weight: UIFontWeightBold)) { self.isReady = true }
                            
        }
    }
    
    
    
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if self.isReady == true { prepareForPresentation() }
 
    }
    
    
    /*
     ====================================================================================================
     -  Secret Presentation
     ====================================================================================================
     */
    
    fileprivate var isReady: Bool = false

    fileprivate func prepareForPresentation() {
        
        isReady = false
        
        
        /*  ==================================================
        -   Fades-out Welcome Animation; calls Secret Presentation Animation
        */

        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: {
            
                        self.secretLabel.presenting.alpha = 0
                        self.secretLabel.secretString.mutableString.setString("") //  Clears secretLabel
            
            }, completion: { _ in

                        self.secretLabel.presenting.alpha = 1
                        self.presentDemoAnimation()
                
        })
    }

    /*  ==================================================
     -  Secret Presentation Animation 
     */
    
    fileprivate func presentDemoAnimation() {
        

        "Hello, World!".start(.whispering, using: self.secretController,
                              newFont: .systemFont(ofSize: 104, weight: UIFontWeightBold),
                              newAlignment: .center,
                              reverses: (true, delay: 1)) {
        
            "This is complicated;\n nothing \n is impossible.".start(.whispering, using: self.secretController,
                                                                     newFont: .systemFont(ofSize: 54, weight: UIFontWeightBold),
                                                                     reverses: (true, 1)) {
            
                "Be \n obsessive \n about what you do.".start(.whispering, using: self.secretController,
                                                              newFont: .systemFont(ofSize: 64, weight: UIFontWeightBold),
                                                              reverses: (true, 1)){
            
                    "And \n don't lick screens; \n that's  how  people get sick.".start(.whispering, using: self.secretController,
                                                                                        newFont: .systemFont(ofSize: 70, weight: UIFontWeightBold),
                                                                                        reverses: (true, 1)) {
            
                        "Dead \n Alien \n Robot \n Ghost \n FTW!".start(.whispering, using: self.secretController,
                                                                        newFont: .systemFont(ofSize: 100, weight: UIFontWeightBold),
                                                                        newAlignment: .right) { self.isReady = true }
                    
                    }
                }
            }
        }
        
    }
    
    
}
