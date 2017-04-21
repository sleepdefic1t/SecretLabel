//
//  SDGSecretController.swift
//  SDGSecretLabel
//
//  Created by SleepDefic1t on 10/19/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//

public class SDGSecretController: NSObject {
    
    var blocks: [BlockOperation] = []
    var label: SDGSecretLabel!
    
    required public init(for label: SDGSecretLabel) {
        
        self.label = label
        
    }
    
}

extension SDGSecretController {

/*
 ====================================================================================================
 -  Entry-point for Secret Animation
 ====================================================================================================
 ====================================================================================================
 
 -  SAMPLE USAGE:
 
     start(.whispering,
            newString: "Hello, World!".
            newFont: .systemFont(ofSize: 50, weight: UIFontWeightBold),
            newAlignment: .center,
            reverses: (true, delay: 1),
            completion = { print("finished") } )
 
 ====================================================================================================
 */
    
    public func start(
        _ state: SDGSecretLabel.SecretState,
                      newString: String? = nil,
                      newFont: UIFont? = nil,
                      newAlignment: NSTextAlignment? = .center,
                      reverses: (Bool, delay: Int)? = (false, 0),
                      with completion: (() -> Void)? = nil) {
        
    /*
     ==================================================
     -  weakSelf: makes self autorelease
     -  safeSelf: guards weakSelf - Ensures auto-releasing self is currently available; or we will safely return from fuction.
     ==================================================
     */
        weak var weakSelf: SDGSecretController? { return self }
        guard let safeSelf: SDGSecretController = weakSelf, let safeLabel = weakSelf?.label else { return }
        
        
        if self.label.secretString.string != newString {
        
        /*  ==================================================  */
        /* This is the Initial Leading Animation Block */
            let newShineBlock = BlockOperation() {
                
                if let font = newFont { safeLabel.presenting.font = font } /* Sets New Font if not nil */
                
                if let alignment = newAlignment { safeLabel.presenting.textAlignment = alignment } /* Sets New Text Alignment if not nil */
                
                if let newestString = newString {
                    
                    safeLabel.secretString.deleteCharacters(in: NSMakeRange(0, safeLabel.secretString.length)) /* Clears Characters */
                    
                    safeLabel.secretString = self.initialString(from: newestString) /* Sets SecreText Characters from newestString */
                    
                    safeSelf.randomizeIntervals(for: safeSelf.label) /* Randomizes Character Animation Intervals */
                    
                }
                
                safeLabel.state = state
                safeLabel.lifetime.create(with: safeLabel.duration)
                safeSelf.updateString()
                
            }
            safeSelf.blocks.insert(newShineBlock, at: 0)
            
        }

    
    /*  ==================================================  */
    /* Only added if the Secrets Animation is set to reverse upon finishing */
        if let reverse = reverses, (reverse.0 == true) {

            let reversal = BlockOperation() {
                sleep(UInt32(reverse.delay)) /* time to remain on screen after fading in */
                safeSelf.start(state.reversed)
            }
            safeSelf.blocks.append(reversal)
            
        }
    
    /*  ==================================================  */
    /* Completion Block added to blocks if present */
        if let completion = completion {
            
            safeSelf.blocks.append( BlockOperation( block: completion) )
            
        }
        
        safeSelf.blocks.run() /* Starts Animations in Custom Block-Queue */
        
    }

    
/*
 ====================================================================================================
 -  Randomizes Secret Animation Character Intervals
 ====================================================================================================
 */

    func randomizeIntervals(for label: SDGSecretLabel) {
        
        label.intervals = .zero
        
        for index in 0..<label.secretString.length {
            
            let delay = UInt32(label.duration / 2 * 100),
                randomDelay = CGFloat(arc4random_uniform(delay)) / 100.0
            
            label.intervals.delays.insert(randomDelay, at: index)
            
            let duration = UInt32(label.duration - randomDelay),
                randomDuration = CGFloat(arc4random_uniform(duration * 100)) / label.duration / 100.0
            
            label.intervals.durations.insert(randomDuration, at: index)
            
        }
        
    }
    
    
    
/*
 ====================================================================================================
 -  Sets Initial Attributes for new Secret String
 ====================================================================================================
 */
    
    func initialString(from string: String) -> NSMutableAttributedString  {

        /*  ==================================================  */
        let attributed = NSMutableAttributedString(string: string)
        
        /*  ==================================================  */
        let paragraphyStyle = NSMutableParagraphStyle()
            paragraphyStyle.alignment = label.presenting.textAlignment
            paragraphyStyle.lineSpacing = 10
        
        /*  ==================================================  */
        let attributes: [[String : Any]] = [
            [NSForegroundColorAttributeName : label.presenting.textColor.withAlphaComponent(0)],
            [NSTextEffectLetterpressStyle : 1],
            [NSFontAttributeName : label.presenting.font],
            [NSParagraphStyleAttributeName : paragraphyStyle]
        ]
        
        attributed.beginEditing()
        
        /*  ==================================================  */
        attributed.enumerateAttribute(NSForegroundColorAttributeName,
                                      in: NSMakeRange(0, attributed.length),
                                      options: .longestEffectiveRangeNotRequired,
                                      using: { (value, range, objectbool) -> Void in
                                        
                                        
                                        for attribute in attributes {
                                            attributed.addAttributes(attribute, range: range)
                                        }
                                        
                                        attributed.fixAttributes(in: range)
                                        
        })
        
        return attributed.mutableCopy() as! NSMutableAttributedString
        
    }
    
/*
 ====================================================================================================
 -  Updates Secret String Attributes During Animation
 ====================================================================================================
 */
    
    func updateString() {
        
        let now = CACurrentMediaTime()
    
    /*
     ==================================================
     -  weakSelf: makes self autorelease
     -  safeSelf: guards weakSelf - Ensures auto-releasing self is currently available; or we will safely return from fuction.
     -  safeLabel: guards weakSelf's label
     ==================================================
     */
        weak var weakSelf: SDGSecretController? { return self }
        guard let safeSelf = weakSelf, let safeLabel = weakSelf?.label else { return }
        
        /*  ==================================================  */
        for index in 0..<safeLabel.secretString.length {
            
            /*  ==================================================  */
            var percent =
                CGFloat(now - safeLabel.lifetime.birth - Double(safeLabel.intervals.delays[index]))
                    / safeLabel.intervals.durations[index]
                    / safeLabel.duration * 1
            
                percent = (safeLabel.state == .forgetting) != true ?
                    percent :
                    percent.distance(to: 0)
            
            if percent > 1 { percent = 1 }
            
            /*  ==================================================  */
            let shadow = NSShadow()
                shadow.shadowColor = UIColor.black.withAlphaComponent(percent*0.75)
                shadow.shadowBlurRadius = 3
                shadow.shadowOffset = CGSize(width: -3, height: -1)
            

            /*  ==================================================  */
            let characterAlpha = [NSForegroundColorAttributeName : safeLabel.presenting.textColor.withAlphaComponent(percent)]
            let shadowAlpha = [NSShadowAttributeName : shadow]
            
            safeLabel.secretString.addAttributes(characterAlpha, range: NSMakeRange(index, 1))
            safeLabel.secretString.addAttributes(shadowAlpha, range: NSMakeRange(index, 1))
            
            safeLabel.presenting.attributedText = safeLabel.secretString
            
            /*  ==================================================  */
            if now > safeLabel.lifetime.death, index == safeLabel.secretString.length-1 {
                
                safeLabel.state = .waiting
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(20), execute: { safeSelf.blocks.run() })
                
            }
            
        }
        
        /*  ==================================================  */
        if safeLabel.state != .waiting {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2),
                                          execute: { safeSelf.updateString() }
            )
            
        }
        
    }
    
}
