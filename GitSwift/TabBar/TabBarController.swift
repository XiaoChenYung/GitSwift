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
        let homeAni = RAMAnimatedTabBarItem(title: "动态", image: #imageLiteral(resourceName: "news-nor"), selImage: #imageLiteral(resourceName: "news"))
        navHome.tabBarItem = homeAni
        let dongtai = NavigationController(rootViewController: BaseViewController(viewModel: (self.viewModel?.sendViewModel)!))
        let dongtaiAni = RAMAnimatedTabBarItem(title: "发送", image: #imageLiteral(resourceName: "home-nor") , selImage: #imageLiteral(resourceName: "home"))
        dongtai.tabBarItem = dongtaiAni
        let me = NavigationController(rootViewController: BaseViewController(viewModel: (self.viewModel?.meViewModel)!))
        let meAni = RAMAnimatedTabBarItem(title: "我的", image: #imageLiteral(resourceName: "me"), selImage: #imageLiteral(resourceName: "me-nor"))
        me.tabBarItem = meAni
//        self.viewControllers = [navHome]  
        super.init(viewControllers: [navHome, dongtai, me])
        let app = APPDELEGATE as! AppDelegate
        app.navigationControllerStack?.pushNavigationController(navigationController: navHome)
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

extension RAMAnimatedTabBarItem {
    convenience init(title: String?, image: UIImage?, selImage: UIImage?) {
        self.init(title: title, image: image, selectedImage: selImage)
        textColor = UIColor(hex: tabBarNormalColor)
        iconColor = UIColor(hex: tabBarNormalColor)
        animation = RAMBounceAnimation(selColor: BaseColor)
    }
}

extension RAMBounceAnimation {
    convenience init (selColor: UIColor) {
        self.init()
        textSelectedColor = selColor
        iconSelectedColor = selColor
    }
}
