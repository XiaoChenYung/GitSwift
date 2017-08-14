//
//  ViewModelService.swift
//  GitSwift
//
//  Created by tm on 2017/7/31.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import RxSwift
import GitClient

enum VCActionType {
    case push
    case pop
    case poproot
    case present
    case dismiss
    case reset
}

struct VCActionParams {
    var type: VCActionType
    var viewModel: ViewModel?
    var animate: Bool?
    var completion: (() -> Swift.Void)?
}

protocol ViewModelService {
    
    var client: Client?  {get}
    
}

class ViewModelServiceImp: NSObject, ViewModelService {
    
    var client: Client?
    
    override init() {
        self.client = Client.client
    }
    
    let onPrepareForAction = PublishSubject<VCActionParams>()
    func pushViewModel(viewModel: ViewModel, animated: Bool = true) {
        onPrepareForAction.onNext(VCActionParams(type: .push, viewModel: viewModel, animate: animated, completion: nil))
    }
    func popViewModel(animated: Bool = true) {
        onPrepareForAction.onNext(VCActionParams(type: .pop, viewModel: nil, animate: animated, completion: nil))
    }
    func popToRootViewModel(animated: Bool = true) {
        onPrepareForAction.onNext(VCActionParams(type: .poproot, viewModel: nil, animate: animated, completion: nil))
    }
    func presentViewModel(viewModel: ViewModel, animated: Bool = true, completion: (() -> Swift.Void)? = nil) {
        onPrepareForAction.onNext(VCActionParams(type: .present, viewModel: viewModel, animate: animated, completion: completion))
    }
    func dismissViewModel(animated: Bool = true, completion: (() -> Swift.Void)? = nil) {
        onPrepareForAction.onNext(VCActionParams(type: .dismiss, viewModel: nil, animate: animated, completion: completion))}
    func resetRootViewModel(viewModel: ViewModel) {
        onPrepareForAction.onNext(VCActionParams(type: .reset, viewModel: viewModel, animate: nil, completion: nil))}
}
