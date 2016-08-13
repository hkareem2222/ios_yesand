//
//  ViewController.swift
//  YesAnd
//
//  Created by Husein Kareem on 7/23/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit
import FirebaseAnalytics

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!GameCenterUtility().localPlayer().authenticated) {
            GameCenterUtility().authenticateLocalPlayer(self)
        }
        FIRAnalytics.logEventWithName("main_vc", parameters: nil)
    }

}

