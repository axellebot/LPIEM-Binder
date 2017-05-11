//
//  User.swift
//  Binder
//
//  Created by iem on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    enum Gender: String {
        case man = "gender1"
        case woman = "gender2"
    }
    
    var _nickname: String?
    var _age: Int?
    var _description: String?
    var _sexe: Gender?
    var _pictureURL: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _nickname    <- map["nickname"]
        _age         <- map["age"]
        _description <- map["description"]
        _sexe        <- map["gender"]
        _pictureURL  <- map["picture"]
    }
}
