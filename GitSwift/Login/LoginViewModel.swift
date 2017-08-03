//
//  LoginViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/8/3.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel: ViewModel {
    
    struct Input {
        let trigger: Driver<Void>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let error: Driver<Error>
    }
    
    func transform(input: Input) -> Output {
        return Output(fetching: Driver.empty(), error: Driver.empty())
    }
    
}
