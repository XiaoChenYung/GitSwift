//
//  LoginViewController.swift
//  GitSwift
//
//  Created by tm on 2017/8/3.
//  Copyright © 2017年 tm. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.backgroundColor = UIColor.red
        testView.drawBottomLine(color: UIColor.yellow)

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