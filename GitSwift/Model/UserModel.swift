//
//  UserModel.swift
//  GitSwift
//
//  Created by 杨晓晨 on 2017/7/22.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserModel: SwiftyJSONAble {
    var avatarUrl: String!
    var loginName: String!
    required init?(jsonData: JSON) {
        self.avatarUrl = jsonData["avatar_url"].stringValue
        self.loginName = jsonData["login"].stringValue
    }
}
