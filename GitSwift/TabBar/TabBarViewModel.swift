//
//  TabBarViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation

class TabBarViewModel: ViewModel {
    
    var homeViewModel: UserListViewModel
    
    override init(service: ViewModelService, params: Dictionary<String, Any>?) {
        self.homeViewModel = UserListViewModel(service: service)
        super.init(service: service, params: params)
    }
}
