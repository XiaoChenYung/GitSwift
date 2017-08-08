//
//  LoginViewController.swift
//  GitSwift
//
//  Created by tm on 2017/8/3.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: BaseViewController {

    @IBOutlet weak var passwordTextField: UnderLineTextField!
    @IBOutlet weak var usernameTextField: UnderLineTextField!
    @IBOutlet weak var loginButton: RadiusButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        Alamofire.request("https://api.github.com/authorizations/clients/73d8c44f52cc65cd1a19", parameters: ["scopes": ["user, repo"], "client_secret": "3b43822f9e972d27d8a19af8e072a702d6167ba2"], encoding: URLEncoding.default,
//                          headers: ["Accept":"application/vnd.github.mirage-preview+json", "X-GitHub-OTP":password])
//            .authenticate(user: user, password: password)
//            .responseJSON { response in
//                debugPrint(response)
//        }
        
        var headers: HTTPHeaders = ["Accept":"application/vnd.github.mirage-preview+json", "X-GitHub-OTP":password]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
            
//        Alamofire.request("https://api.github.com/authorizations/clients/73d8c44f52cc65cd1a19", method: .put, parameters: ["scopes": ["user", "repo"], "client_secret": "3b43822f9e972d27d8a19af8e072a702d6167ba2"], encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//                debugPrint(response)
//        }
        
                Alamofire.request("https://api.github.com/users/XiaoChenYung/received_events", method: .get, parameters: ["per_page": 100], encoding: URLEncoding.default, headers: headers)
                    .responseJSON { response in
                        debugPrint(response)
                }

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
