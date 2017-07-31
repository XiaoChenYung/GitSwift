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
    
    private var services: ViewModelService?
    private var navigationControllers: Array<UINavigationController>?
    
    init(_ services: ViewModelService) {
        self.services = services
        self.navigationControllers = Array()
    }
    
    func pushNavigationController(navigationController: UINavigationController) {
        if (navigationControllers?.contains(navigationController))! {
            return
        }
        navigationController.delegate = self
        navigationControllers?.removeLast()
    }
    
    func popNavigationController() -> UINavigationController {
        let navigationVC = navigationControllers?.last
        navigationControllers?.removeLast()
        return navigationVC!
    }
    
    func topNavigationController() -> UINavigationController {
        return (navigationControllers?.last)!
    }
    
    func registerNavigationHooks() {
        
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
