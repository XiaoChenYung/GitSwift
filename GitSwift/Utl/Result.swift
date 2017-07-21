//
//  Result.swift
//  GitSwift
//
//  Created by tm on 2017/7/21.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import SwiftyJSON

class Result<T: SwiftyJSONAble>: SwiftyJSONAble {
    var element: T?
    required init?(jsonData: JSON) {
        self.element = T(jsonData: jsonData)
    }
}
