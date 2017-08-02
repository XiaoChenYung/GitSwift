//
//  TabBarViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import NetWork

class TabBarViewModel: ViewModel {
    
    var homeViewModel: UserListViewModel
    var sendViewModel: ViewModel
    var meViewModel: ViewModel
    
    init(service: ViewModelService, params: Dictionary<String, Any>?) {
        self.homeViewModel = UserListViewModel(service: service, params: nil, provider: NetWork.UseCaseProvider())
        self.meViewModel = ViewModel(service: service)
        self.sendViewModel = ViewModel(service: service)
        super.init(service: service, params: params)
    }
}
