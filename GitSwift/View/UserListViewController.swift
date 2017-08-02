//
//  UserListViewController.swift
//  GitSwift
//
//  Created by tm on 2017/8/1.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit

class UserListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let lable = UILabel()
        lable.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        lable.text = "哈哈哈哈"
        lable.textColor = UIColor.red
        lable.isUserInteractionEnabled = true
        view.addSubview(lable)
        
        let buttom = UIButton(type: UIButtonType.contactAdd)
        view.addSubview(buttom)
//        buttom.rx.tap.subscribe(onNext: <#T##((()) -> Void)?##((()) -> Void)?##(()) -> Void#>, onError: <#T##((Error) -> Void)?##((Error) -> Void)?##(Error) -> Void#>, onCompleted: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDisposed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
