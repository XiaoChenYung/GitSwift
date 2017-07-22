//
//  ViewController.swift
//  GitSwift
//
//  Created by tm on 2017/7/19.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import RxSwift
import SwiftyJSON

let disposeBag = DisposeBag()


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        netRequest(url: "users", params: ["ddd":"ds"])
        .mapSwiftJSONArray(Result<UserModel>.self)
        .subscribe(onNext: { json in
            let result = json.first
            let value = result?.element
            print(value ?? "")
        }).addDisposableTo(disposeBag)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

