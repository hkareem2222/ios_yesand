//
//  ProfileViewController.swift
//  YesAnd
//
//  Created by Joseph DiVittorio on 7/24/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit
import FirebaseAnalytics

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        FIRAnalytics.logEventWithName("profile_vc", parameters: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        FIRAnalytics.logEventWithName("profile_vc", parameters: nil)
        fatalError()
    }

}
