//
//  SceneViewController.swift
//  YesAnd
//
//  Created by Joseph DiVittorio on 7/24/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

    @IBOutlet weak var conversationButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scene"
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let vc = UIStoryboard.chatStoryboard().instantiateInitialViewController()!
        navigationController?.presentViewController(vc, animated: true, completion: nil)
    }

}