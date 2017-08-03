//
//  NavigationController.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override var shouldAutorotate: Bool {
        return (self.topViewController?.shouldAutorotate)!
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (self.topViewController?.supportedInterfaceOrientations)!
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return (self.topViewController?.preferredStatusBarStyle)!
    }

}
