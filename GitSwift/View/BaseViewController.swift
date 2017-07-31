//
//  ViewController.swift
//  GitSwift
//
//  Created by tm on 2017/7/31.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    public var snapshot: UIView?
    public var interactivePopTransition: UIPercentDrivenInteractiveTransition?
    
    override func viewWillDisappear(_ animated: Bool) {
        if isMovingFromParentViewController {
            snapshot = navigationController?.view.snapshotView(afterScreenUpdates: false)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        extendedLayoutIncludesOpaqueBars = true
        if navigationController != nil && self != navigationController?.viewControllers.first {
            let popRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePopRecognizer(recognizer:)))
            view.addGestureRecognizer(popRecognizer)
        }
        // Do any additional setup after loading the view.
    }
    
    func handlePopRecognizer(recognizer: UIPanGestureRecognizer) {
        var progress = recognizer.translation(in: view).x / view.frame.width
        progress = min(1.0, max(0.0, progress))
        if recognizer.state == UIGestureRecognizerState.began {
            interactivePopTransition = UIPercentDrivenInteractiveTransition()
            navigationController?.popViewController(animated: true)
        } else if recognizer.state == UIGestureRecognizerState.changed {
            interactivePopTransition?.update(progress)
        } else if recognizer.state == UIGestureRecognizerState.ended || recognizer.state == UIGestureRecognizerState.cancelled {
            if progress > 0.2 {
                interactivePopTransition?.finish()
            } else {
                interactivePopTransition?.cancel()
            }
            interactivePopTransition = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension BaseViewController {
    @nonobjc func gestureRecognizerShouldBegin(_ gestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return gestureRecognizer.velocity(in: view).x > 0
    }
}
