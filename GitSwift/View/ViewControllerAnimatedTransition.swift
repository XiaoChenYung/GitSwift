//
//  ViewControllerAnimatedTransition.swift
//  GitSwift
//
//  Created by tm on 2017/7/31.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class ViewControllerAnimatedTransition:NSObject, UIViewControllerAnimatedTransitioning {
    
    var fromViewController: BaseViewController
    var toViewController: BaseViewController
    var operation: UINavigationControllerOperation
    
    init(_ operation: UINavigationControllerOperation, _ fromViewController: BaseViewController, _ toViewController: BaseViewController) {
        self.operation = operation
        self.fromViewController = fromViewController
        self.toViewController = toViewController
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! BaseViewController
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! BaseViewController
        let duration = transitionDuration(using: transitionContext)
        if (operation == UINavigationControllerOperation.push) {
            transitionContext.containerView.addSubview(fromVC.snapshot!)
            fromVC.view.isHidden = false
            let frame = transitionContext.finalFrame(for: toVC)
            toVC.view.frame = frame.offsetBy(dx: frame.width, dy: 0)
            transitionContext.containerView.addSubview((toVC.view)!)
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: { 
                fromVC.snapshot?.alpha = 0.0
                fromVC.snapshot?.frame = fromVC.view.frame.insetBy(dx: 20, dy: 20)
                toVC.view.frame = toVC.view.frame.offsetBy(dx: -frame.width, dy: 0)
            }, completion: { finished in
                fromVC.view.isHidden = false
                fromVC.snapshot?.removeFromSuperview()
                transitionContext.completeTransition(true)
            })
        } else if operation == UINavigationControllerOperation.pop {
            APPDELEGATE?.window??.backgroundColor = UIColor.black
            fromVC.view.addSubview(fromVC.snapshot!)
            let tabbar = fromVC.tabBarController as! RAMAnimatedTabBarController
            let tabbarHidden = tabbar.isHidden
            fromVC.navigationController?.navigationBar.isHidden = true
            tabbar.animationTabBarHidden(true)
            toVC.snapshot?.alpha = 0.5
            toVC.snapshot?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            let toViewWrapperView = UIView(frame: transitionContext.containerView.bounds)
            toViewWrapperView.addSubview(toVC.view)
            toViewWrapperView.isHidden = true
            transitionContext.containerView.addSubview(toViewWrapperView)
            transitionContext.containerView.addSubview(toVC.snapshot!)
            transitionContext.containerView.bringSubview(toFront: fromVC.view)
            
            UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
                fromVC.view.frame = fromVC.view.frame.offsetBy(dx: fromVC.view.frame.width, dy: 0)
                toVC.snapshot?.alpha = 1
                toVC.snapshot?.transform = CGAffineTransform.identity
            }, completion: { (finished) in
                APPDELEGATE?.window??.backgroundColor = UIColor.white
                toVC.navigationController?.navigationBar.isHidden = false
                tabbar.animationTabBarHidden(tabbarHidden)
                fromVC.snapshot?.removeFromSuperview()
            toVC.snapshot?.removeFromSuperview()
                toViewWrapperView.removeFromSuperview()
                if !transitionContext.transitionWasCancelled {
                    for subview in toViewWrapperView.subviews {
                        transitionContext.containerView.addSubview(subview)
                    }
                 }
                if toVC.navigationController?.viewControllers.count == 1 {
                    tabbar.animationTabBarHidden(false)
                }
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
            
        }
        
    }
    
}
