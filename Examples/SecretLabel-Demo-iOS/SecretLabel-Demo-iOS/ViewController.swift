//
//  ViewController.swift
//  SecretLabel-Demo-iOS
//
//  Created by simon on 10/19/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    let secretViewController = SecretViewController()
    
    
    override func loadView() {
        
        view = UIView(frame: UIScreen.main.bounds)
        view.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(.flexibleHeight)

               view.backgroundColor = .clear

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(secretViewController)
        
        view.addSubview(secretViewController.view)
        
        
        view.subviews.forEach({
            $0.autoresizingMask = view.autoresizingMask
            $0.frame = view.frame
        })


    }
    

}
