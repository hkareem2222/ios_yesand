//
//  GameCenterUtility.swift
//  YesAnd
//
//  Created by Husein Kareem on 7/23/16.
//  Copyright © 2016 Yes, And, LLC. All rights reserved.
//

import UIKit
import GameKit

class GameCenterUtility {
    
    func localPlayer() -> GKLocalPlayer {
        return GKLocalPlayer.localPlayer()
    }
    
    func authenticateLocalPlayer(viewController: UIViewController) {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {(gameCenterViewController: UIViewController?, error: NSError?) -> Void in
            guard let gameCenterViewController = gameCenterViewController else {
                return
            }
            
            viewController.presentViewController(gameCenterViewController,
                                                 animated: true,
                                                 completion: nil)
        }
    }
}