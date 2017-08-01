//
//  ViewRouter.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit

//struct ViewRouter {

    func viewControllerFromViewModel (viewModel: ViewModel?) -> UIViewController {
//        assert(viewModel == nil, "viewModel不得为🈳️")
        if viewModel!.isMember(of: UserListViewModel.self) {
            return UserListViewController(viewModel: viewModel!)
        } else if viewModel!.isMember(of: TabBarViewModel.self) {
            return TabBarController(viewModel: viewModel!)
        }
        return BaseViewController(viewModel: viewModel!)
    }
    
//}
