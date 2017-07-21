//
//  SwiftyJSONAble.swift
//  GitSwift
//
//  Created by tm on 2017/7/21.
//  Copyright © 2017年 tm. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol SwiftyJSONAble {
    init?(jsonData: JSON)
}
