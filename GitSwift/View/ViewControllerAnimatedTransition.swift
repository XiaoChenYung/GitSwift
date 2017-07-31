//
//  ViewControllerAnimatedTransition.swift
//  GitSwift
//
//  Created by tm on 2017/7/31.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import CoreGraphics

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
            
        }
        
    }
    
}
