//
//  NavigationControllerStack.swift
//  GitSwift
//
//  Created by tm on 2017/7/31.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NavigationControllerStack: NSObject, UINavigationControllerDelegate {
    
    let disposeBag = DisposeBag()
    
    
    private var services: ViewModelService?
    private var navigationControllers: Array<UINavigationController>?
    
    init(services: ViewModelService) {
        super.init()
        self.services = services
        self.navigationControllers = Array()
        self.registerNavigationHooks()
    }
    
    func pushNavigationController(navigationController: UINavigationController) {
        if (navigationControllers?.contains(navigationController))! {
            return
        }
        navigationController.delegate = self
        navigationControllers?.removeLast()
    }
    
//     func pushViewModel(viewModel: ViewModel, animated: Bool = true) {}
    
    func popNavigationController() -> UINavigationController {
        let navigationVC = navigationControllers?.last
        navigationControllers?.removeLast()
        return navigationVC!
    }
    
    func topNavigationController() -> UINavigationController {
        return (navigationControllers?.last)!
    }
    
    func registerNavigationHooks() {
        let serviceImp = self.services as! ViewModelServiceImp
        serviceImp.onPrepareForAction.subscribe(onNext: { (params) in
            switch params.type {
            case .push:
                let topVC = self.navigationControllers?.last?.topViewController as! BaseViewController
                if topVC.tabBarController != nil {
                    topVC.snapshot = topVC.tabBarController?.view.snapshotView(afterScreenUpdates: false)
                } else {
                    topVC.snapshot = self.navigationControllers?.last?.view.snapshotView(afterScreenUpdates: false)
                }
                let VC = viewControllerFromViewModel(viewModel: params.viewModel)
                VC.hidesBottomBarWhenPushed = true
                self.navigationControllers?.last?.pushViewController(VC, animated: true)
            case .pop:
                self.navigationControllers?.last?.popViewController(animated: params.animate!)
            case .reset:
                APPDELEGATE?.window??.rootViewController = viewControllerFromViewModel(viewModel: params.viewModel)
            default:
                print("")
            }
        }).addDisposableTo(disposeBag)
    }
}

extension NavigationControllerStack {
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: ViewControllerAnimatedTransition) -> UIViewControllerInteractiveTransitioning? {
        return animationController.fromViewController.interactivePopTransition
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: BaseViewController, to toVC: BaseViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC.interactivePopTransition != nil {
            return ViewControllerAnimatedTransition(operation, fromVC, toVC)
        }
        return nil
    }
}
