//
//  ViewRouter.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit

//struct ViewRouter {

    func viewControllerFromViewModel (viewModel: ViewModel) -> BaseViewController {
        if viewModel.isMember(of: UserListViewModel.self) {
            return UserListViewController(viewModel: viewModel)
        }
        return BaseViewController(viewModel: viewModel)
    }
    
//}
