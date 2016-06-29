//
//  AppDelegate.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let navigationController = window?.rootViewController as! UINavigationController
        
        navigationController.navigationBar.translucent = false
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        navigationController.navigationBar.barTintColor = UIColor.flatSandColorDark()
        navigationController.navigationBar.tintColor = UIColor.flatCoffeeColorDark()
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.flatCoffeeColorDark()]
        
        return true
    }
}