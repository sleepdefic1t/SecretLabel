//
//  Array+BlockOperation.swift
//  SDGSecretLabel
//
//  Created by SleepDefic1t on 10/19/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//

extension Array where Element: BlockOperation {
    
    mutating func run() {
        
        if self.count > 1 {
            
            for index in 1..<self.count where self[index].dependencies.count == 0 {
                
                self[index].addDependency(self[index-1])
                
            }
            
        }
        
        guard let start = self.first?.start(), self.count > 0 else { return }
        
        start
        removeFirst()
        
    }
    
}
