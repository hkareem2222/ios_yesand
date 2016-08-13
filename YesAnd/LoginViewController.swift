//
//  LoginViewController.swift
//  YesAnd
//
//  Created by Joseph DiVittorio on 8/12/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        FIRAnalytics.logEventWithName("login_shown", parameters: nil)
    }

    @IBAction func submitPressed(sender: AnyObject) {
        guard let email = emailTextField.text, password = passwordTextField.text else { return } // alert
        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { user, error in
            if let user = user {
                print(user)
            } else {
                print(error)
            }
        })
    }

}
