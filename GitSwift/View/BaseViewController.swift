//
//  ViewController.swift
//  GitSwift
//
//  Created by tm on 2017/7/31.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController
import RxSwift

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let disposeBag = DisposeBag()
    
    
    public var snapshot: UIView?
    public var interactivePopTransition: UIPercentDrivenInteractiveTransition?
    var viewModel: ViewModel?
    
    init(viewModel: ViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController != nil && self.navigationController?.viewControllers.count == 1 {
            let tabbarVC = self.tabBarController as! RAMAnimatedTabBarController
            tabbarVC.animationTabBarHidden(false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if isMovingFromParentViewController {
            snapshot = navigationController?.view.snapshotView(afterScreenUpdates: false)
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        extendedLayoutIncludesOpaqueBars = true
        if navigationController != nil && self != navigationController?.viewControllers.first {
            let popRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePopRecognizer(recognizer:)))
            view.addGestureRecognizer(popRecognizer)
            popRecognizer.delegate = self
        }
        bindViewModel()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        viewModel?.title.asObservable()
        .subscribe(onNext: { [unowned self] (title) in
            self.navigationItem.title = title
        }).addDisposableTo(disposeBag)
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
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let panGes = gestureRecognizer as! UIPanGestureRecognizer
        
        return panGes.velocity(in: view).x > 0
    }
    
//    private func gestureRecognizerShouldBegin(_ gestureRecognizer: UIPanGestureRecognizer) -> Bool {
//        print("llll")
//        return gestureRecognizer.velocity(in: view).x > 0
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
