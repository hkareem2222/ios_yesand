//
//  AppDelegate.swift
//  YesAnd
//
//  Created by Husein Kareem on 7/23/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAnalytics

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router = Router()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FIRApp.configure()
        checkAndRenewLogin()
        return true
    }

    func checkAndRenewLogin() {
        FIRAuth.auth()?.addAuthStateDidChangeListener { [weak self] auth, user in
            if let _ = user {
                self?.showTabBarController()
            } else {
                self?.showLogin()
            }
        }
    }

    func showTabBarController() {
        window = router.configureTabBarController()
        router.setTabBarControllers()
        window?.tintColor = .redColor()
        FIRAnalytics.logEventWithName("authed_user", parameters: nil)
    }

    func showLogin() {
        let vc: LoginViewController = UIStoryboard.sharedStoryboard().instantiateInitialViewController() as! LoginViewController
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        router.window = window
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

