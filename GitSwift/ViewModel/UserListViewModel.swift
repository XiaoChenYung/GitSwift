//
//  UserListViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/7/28.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Domain
import NetWork

class UserListViewModel: ViewModel, ViewModelType {
    
    struct Input {
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    struct Output {
        let fetching: Driver<Bool>
        let users: Driver<[User]>
        let selectedPost: Driver<User>
        let error: Driver<Error>
    }
    
    func transform(input: UserListViewModel.Input) -> UserListViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let users = input.trigger.flatMapLatest { () -> SharedSequence<DriverSharingStrategy, [User]> in 
//            guard let gprovider = self.provider else {
//                assert(false, "listProvider == nil")
//            }
//            if let listProvider as NetWork.UseCaseProvider {
//                return listProvider.makeAllUserUseCase()
//            }
            let listProvider = self.provider as! NetWork.UseCaseProvider
            let userCase = listProvider.makeAllUserUseCase()
            return userCase.users().trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriver(onErrorJustReturn: [])
        }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        let selectedUser = input.selection.withLatestFrom(users) { (indexPath, users) -> User in
            return users[indexPath.row]
        }
        return Output(fetching: fetching, users: users, selectedPost: selectedUser, error: errors)
    }
}
