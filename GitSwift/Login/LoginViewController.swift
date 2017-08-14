//
//  LoginViewController.swift
//  GitSwift
//
//  Created by tm on 2017/8/3.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import Alamofire
import RxAlamofire
import RxSwift
import GitClient

class LoginViewController: BaseViewController {
    
    let dis = DisposeBag()
    

    @IBOutlet weak var passwordTextField: UnderLineTextField!
    @IBOutlet weak var usernameTextField: UnderLineTextField!
    @IBOutlet weak var loginButton: RadiusButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel?.service.client?.login(username: "xiaochenyung", password: "wenweiyv123456").subscribe(onNext: { client in
            print(client)
        }).addDisposableTo(dis)
        
//        let request = Alamofire.request("https://api.github.com/users").responseJSON { (response) in
//            
//        }
        
        
        
        
        
//        let block: ((_ a: Int) -> (Observable<Int>)) = { a in
//            Observable.create({ subscriber -> Disposable in
//                subscriber.on(.next(a))
//                subscriber.onCompleted()
//                return Disposables.create()
//            })
//        }
//        
//        
//        
//        let fruitObservable = Observable.from(["🍎", "🍐", "🍊","🦋"])
//        let stringObservable = Observable.from(["❤️","👠","👛","🐤"])
//        let animalObservable = Observable.from(["🐶","🐱","🐭","🐹","👢","🦀"])
//        let other = Observable.from(["🏈","🎱","⚾️"])
//        
//        let aaa = block(10)
//        aaa.flatMap { a -> Observable<Int> in
//            if a > 10000 {
//               return Observable.just(a)
//            } else {
//               return block(a * a)
//            }
//            }
//            .subscribe(onNext: { a in
//                            print(a)
//                        }).addDisposableTo(dis)
//        aaa.flatMap { a in
//            let b = a as Int
//            Observable.just(b)
//        }.subscribe(onNext: { a in
//            print(a)
//        }).addDisposableTo(dis)
        
//        self.viewModel?.service.client?.login(username: <#T##String#>, password: <#T##String#>)
        
        
//        let ooo = Observable.combineLatest([fruitObservable, stringObservable, animalObservable, other])
//        ooo.flatMap {
//            Observable.just($0[0])
//        }.subscribe(onNext: { (string) in
//            print(string)
//        }).addDisposableTo(dis)
        
        
        //        let user = "xiaochenyung"
        //        let password = "wenweiyv123456"
        
//        let user = "08e8f67b57b54e4bffeef5f343b669e228a0a336"
//        let password = "x-oauth-basic"
        
//        Alamofire.request("https://api.github.com/authorizations/clients/73d8c44f52cc65cd1a19", parameters: ["scopes": ["user, repo"], "client_secret": "3b43822f9e972d27d8a19af8e072a702d6167ba2"], encoding: URLEncoding.default,
//                          headers: ["Accept":"application/vnd.github.mirage-preview+json", "X-GitHub-OTP":password])
//            .authenticate(user: user, password: password)
//            .responseJSON { response in
//                debugPrint(response)
//        }
        
//        var headers: HTTPHeaders = ["Accept":"application/vnd.github.mirage-preview+json", "X-GitHub-OTP":password]
//        
//        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
//            headers[authorizationHeader.key] = authorizationHeader.value
//        }
//        
//        
//        RxAlamofire.requestJSON( .get, "https://api.github.com/users/XiaoChenYung/received_events", parameters: ["per_page": 100], encoding: URLEncoding.default, headers: headers)
//            .subscribe(onNext: { response in
//                print(response.1)
//            })
        
        
        
            
//        Alamofire.request("https://api.github.com/authorizations/clients/73d8c44f52cc65cd1a19", method: .put, parameters: ["scopes": ["user", "repo"], "client_secret": "3b43822f9e972d27d8a19af8e072a702d6167ba2"], encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//                debugPrint(response)
//        }
        
//                RxAlamofire.request("https://api.github.com/users/XiaoChenYung/received_events", method: .get, parameters: ["per_page": 100], encoding: URLEncoding.default, headers: headers)
//                    .responseJSON { response in
//                        debugPrint(response)
//                }

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
