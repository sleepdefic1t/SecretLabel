//
//  String+StringShineable.swift
//  SDGSecretLabel
//
//  Created by simon on 10/19/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//


/*
 ====================================================================================================
 -  Extends Entry-point for Secret Animation to String
 ====================================================================================================
 ====================================================================================================
 
 -  SAMPLE USAGE:
 
 "Hello, World!".start(.shining,
                        using: self.secretController,
                        newFont: .systemFont(ofSize: 50, weight: UIFontWeightBold),
                        newAlignment: .center,
                        reverses: (true, delay: 1),
                        completion = { print("finished") } )
 
 ====================================================================================================
 */

extension String {
    
    public func start(_ state: SDGSecretLabel.SecretState,
                      using controller: SDGSecretController,
                      newFont: UIFont? = nil,
                      newAlignment: NSTextAlignment? = .center,
                      reverses: (Bool, delay: Int)? = (false, 0),
                      with completion: (() -> Void)? = nil) {
                
        controller.start(state,
                         newString: self,
                         newFont: newFont,
                         newAlignment: newAlignment,
                         reverses: reverses,
                         with: completion)
        
    }
    
}
