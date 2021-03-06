//
//  ViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/7/19.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain

protocol ViewModelType {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
    
}

enum TitleViewType {
    case TitleViewTypeDefault //Single title
    case TitleViewTypeDoubleTitle //Double title
    case TitleViewTypeLoadingTitle //Loading title
}

class ViewModel: NSObject {

    var title: Variable<String> = Variable("") //主标题
    var subtitle: Variable<String> = Variable("") //副标题
    var titleType: Variable<TitleViewType> = Variable(TitleViewType.TitleViewTypeDefault) //标题类型
    var service: ViewModelServiceImp
    var params: Dictionary<String, Any>?
    var provider: Domain.UseCaseProvider?  
    
    init(service: ViewModelServiceImp, params: Dictionary<String, Any>? = nil, provider: Domain.UseCaseProvider? = nil) {
        self.service = service
        self.params = params
        self.provider = provider
        super.init()
    }
    
}

