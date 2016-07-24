//
//  Router.swift
//  YesAnd
//
//  Created by Joseph DiVittorio on 7/24/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit

class Router {

    enum VCType: Int {
        case Main, Scene, Profile
    }

    var window: UIWindow?
    private var tabBarController: UITabBarController?

    func screenViewController() -> UIViewController? {
        return tabBarController
    }

    func currentViewController() -> UIViewController? {
        return tabBarController?.selectedViewController
    }

    func configureTabBarController() -> UIWindow? {
        tabBarController = UITabBarController()
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return window
    }

    func setTabBarControllers() {
        let mainVC: UIViewController = UIStoryboard.mainStoryboard().instantiateInitialViewController()!
        let sceneVC: UIViewController = UIStoryboard.sceneStoryboard().instantiateInitialViewController()!
        let profileVC: UIViewController = UIStoryboard.profileStoryboard().instantiateInitialViewController()!

        mainVC.tabBarItem = UITabBarItem(title: "Main", image: nil, selectedImage: nil)
        sceneVC.tabBarItem = UITabBarItem(title: "Scene", image: nil, selectedImage: nil)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)

        let vcs = [mainVC, sceneVC, profileVC]

        tabBarController?.setViewControllers(vcs, animated: false)
        tabBarController?.selectedIndex = 0
    }

    func setViewControllerTab(type: VCType) {
        tabBarController?.selectedIndex = type.rawValue
    }

    func removeTabBarController() {
        tabBarController = nil
    }

}
