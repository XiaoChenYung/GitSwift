//
//  UserListViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/7/28.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation

class UserListViewModel: BaseViewModel {
    var dataSource: [Result<UserModel>] = []
    
    override init() {
        super.init()
        
    }
    
    func requestUsers() {
        GitClient.client.request(method: .GET, url: "users")
            .mapSwiftJSONArray(Result<UserModel>.self)
            .subscribe(onNext: { [unowned self] list in
                self.dataSource = list
            }, onError: { error in
                print(error)
            })
            .addDisposableTo(disposeBag)
    }
    
}
