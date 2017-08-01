//
//  TabBarController.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class TabBarController: RAMAnimatedTabBarController {
    
    var viewModel: TabBarViewModel?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel as? TabBarViewModel
        let navHome = NavigationController(rootViewController: UserListViewController(viewModel: (self.viewModel?.homeViewModel)!))
        navHome.tabBarItem = RAMAnimatedTabBarItem(title: "首页", image: #imageLiteral(resourceName: "home"), selectedImage: nil)
//        self.viewControllers = [navHome]  
        super.init(viewControllers: [navHome])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
