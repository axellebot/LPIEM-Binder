//
//  Bind.swift
//  Binder
//
//  Created by iem on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import Foundation
import ObjectMapper

class Bind: BaseModel {
    var _conversationd: String?
    var _firstUser: User?
    var _secondUser: User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _conversationd <- map["conversationd"]
        _firstUser     <- map["user1Id"]
        _secondUser    <- map["user2Id"]
    }
}
