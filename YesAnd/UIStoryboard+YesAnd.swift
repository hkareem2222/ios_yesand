//
//  UIStoryboard+YesAnd.swift
//  YesAnd
//
//  Created by Joseph DiVittorio on 7/24/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit

extension UIStoryboard {

    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }

    class func sceneStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Scene", bundle: nil)
    }

    class func profileStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Profile", bundle: nil)
    }

}
