//
//  AppDelegate.swift
//  SecretLabel-Demo-iOS
//
//  Created by SleepDefic1t on 10/19/16.
//  Copyright © 2016 ☠️👽🤖👻. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var mainWindow: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        mainWindow = UIWindow(frame: UIScreen.main.bounds)
        mainWindow?.backgroundColor = .black
        mainWindow?.rootViewController = ViewController()
        mainWindow?.makeKeyAndVisible()

        return true
        
    }

}
