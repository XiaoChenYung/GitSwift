//
//  ViewModel.swift
//  GitSwift
//
//  Created by tm on 2017/7/19.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation

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
    
}

