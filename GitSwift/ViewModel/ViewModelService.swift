//
//  ViewModelService.swift
//  GitSwift
//
//  Created by tm on 2017/7/31.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation

protocol ViewModelService {
    
}

class ViewModelServiceImp: ViewModelService {
    func pushViewModel(_ viewModel: ViewModel, animated flag: Bool = true) {}
    func popViewModel(animated flag: Bool = true) {}
    func popToRootViewModel(animated flag: Bool = true) {}
    func presentViewModel(_ viewModel: ViewModel, animated flag: Bool = true, completion: (() -> Swift.Void)? = nil) {}
    func dismissViewModel(animated flag: Bool = true, completion: (() -> Swift.Void)? = nil) {}
    func resetRootViewModel(_ viewModel: ViewModel) {}
}
