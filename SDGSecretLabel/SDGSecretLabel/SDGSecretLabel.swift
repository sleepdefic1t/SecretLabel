//
//  SDGSecretLabel.swift
//  SDGSecretLabel
//
//  Created by SleepDefic1t on 10/19/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//

import Foundation

open class SDGSecretLabel {
    
    var duration: CGFloat = 3.0
    var intervals: Intervals = .zero
    var lifetime: LifeTime = LifeTime(birth: 0, death: 0)
   
    public var state: SecretState = .waiting
    public var presenting: UILabel = UILabel()
    public var secretString: NSMutableAttributedString = NSMutableAttributedString()

    public init() {
    
        presenting.frame = UIScreen.main.bounds
        presenting.backgroundColor = .clear
        presenting.numberOfLines = 0
        presenting.textAlignment = .center
        presenting.clearsContextBeforeDrawing = true
        presenting.autoresizingMask = UIViewAutoresizing.flexibleWidth.union(.flexibleHeight)
    
    }

}

extension SDGSecretLabel {
    
/*
 ====================================================================================================
 -  Sets animation duration between characters
 ====================================================================================================
 */
    
    struct Intervals {
        
        var durations: [CGFloat], delays: [CGFloat]
        
        static var zero: Intervals { return Intervals(durations: [], delays: []) }

    }
    

/*
 ====================================================================================================
 -  Sets Start(birth) and End(death)-times; or "LifeTime" for the Secret Animation
 ====================================================================================================
 */
    
    struct LifeTime {
        
        var birth: CFTimeInterval, death: CFTimeInterval
        
        mutating func create(with duration: CGFloat) {
            
            self.birth = CACurrentMediaTime()
            self.death = birth + CFTimeInterval(duration)
            
        }
        
    }
    
    
/*
 ====================================================================================================
 -  Secret Animation State Enumeration; includes reverse for fading back out/in after animation
 ====================================================================================================
 */

    public enum SecretState  {
        
        /* -  Ready  /  Fade In  / Fade Out - */
        case waiting, whispering, forgetting
        
        var reversed: SecretState {
            
            switch self {
                case .whispering: return .forgetting
                case .forgetting: return .whispering
            default: return .waiting
            }
            
        }
        
    }
    
}
