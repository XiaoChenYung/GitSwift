//
//  ViewController.swift
//  GitSwift
//
//  Created by tm on 2017/7/19.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RxSwift

let disposeBag = DisposeBag()


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        request(method: .Get, url: "users", params: ["fff":"sdf"]).subscribe(onNext: { json in
            print(json)
        })
        
        .addDisposableTo(disposeBag)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

