//
//  Message.swift
//  Binder
//
//  Created by iem on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import Foundation
import ObjectMapper

class Message {
    var _content: String?
    var _timestamp: String?
    var _userId: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _content   <- map["content"]
        _timestamp <- map["timestamp"]
        _userId    <- map["userId"]
    }
}
