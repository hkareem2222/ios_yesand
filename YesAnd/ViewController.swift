//
//  ViewController.swift
//  YesAnd
//
//  Created by Husein Kareem on 7/23/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GameCenterUtility().authenticateLocalPlayer(self)
    }
    
}

