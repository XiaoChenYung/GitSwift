//
//  NavigationController.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationBar.setBackgroundImage(UIImage.imageWithColor(color: BaseColor), for: UIBarMetrics.default)
        navigationBar.barTintColor = BaseColor
        navigationBar.barStyle = .black
        navigationBar.tintColor = UIColor.white
    }
    
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
