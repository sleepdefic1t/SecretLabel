# SecretLabel

Swift 3.0 Implementation of 'The Secret' apps' Text Animation.

[![Swift Version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat)](https://github.com/apple/swift)
![Platform](https://img.shields.io/badge/platform-iOS-blue.svg)
[![BUILD](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/deadAlienRobotGhost/SecretLabel)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/license-CC%20BY--SA%204.0-brightgreen.svg)](http://creativecommons.org/licenses/by-sa/4.0/)

![SecretLabel](https://github.com/deadAlienRobotGhost/SecretLabel/blob/master/SecretLabel.gif)



## Usage

*from string:*
```swift

  "Hello, World!".start(.whispering,
                        using: self.secretController,
                        newFont: .systemFont(ofSize: 104, weight: UIFontWeightBold),
                        newAlignment: .center,
                        reverses: (true, delay: 1)) { print("finished) }
                        
```

*from controller:*
```swift

    start(.whispering,
          newString: "Hello, World!".
          newFont: .systemFont(ofSize: 50, weight: UIFontWeightBold),
          newAlignment: .center,
          reverses: (true, delay: 1),
          completion = { print("finished") } )
          
```

## Requirements

- iOS 9.0+


## Acknowledgments

[Natasha the Robot](https://github.com/natashatherobot) - https://www.natashatherobot.com
- [SecretTextAnimatiomExample](https://github.com/NatashaTheRobot/SecretTextAnimationExample)


[zipme](https://github.com/zipme)
- [RQShineLabel](https://github.com/zipme/RQShineLabel)


## Suggested Resources

[Awesome-iOS](https://github.com/vsouza/awesome-ios)
- THE best list of awesome iOS Open-Source Objective-C and Swift Projects! 
    (maintained by [vsouza](https://github.com/vsouza))


[Build Time Analyzer for Xcode](https://github.com/RobertGummesson/BuildTimeAnalyzer-for-Xcode)
- Exellent Swift Build-Time Analyzer for Xcode by [RobertGummeson](https://github.com/RobertGummesson)


## About

SecretLabel is maintained by [SleepDefic1t](http://github.com/sleepdefic1t).

The names and logos for DeadAlienRobotGhost are trademarks of [DeadAlienRobotGhost](https://github.com/deadAlienRobotGhost).


## License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

This is free software from [SleepDefic1t](https://github.com/sleepdefic1t) / [DeadAlienRobotGhost](https://github.com/deadAlienRobotGhost), and may be redistributed accordingly
under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE
