//
//  AppDelegate.swift
//  YesAnd
//
//  Created by Husein Kareem on 7/23/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router = Router()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        showTabBarController()
        return true
    }

    func showTabBarController() {
        window = router.configureTabBarController()
        router.setTabBarControllers()
        window?.tintColor = .redColor()
    }
}

