//
//  Appointments.swift
//  Binder
//
//  Created by iem on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import Foundation
import ObjectMapper

class Appointments: BaseModel {
    var _bindId: String?
    var _description: String?
    var _location: Location?
    var _timestamp: CLong?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        _bindId      <- map["bindId"]
        _description <- map["description"]
        _location    <- map["location"]
        _timestamp   <- map["timestamp"]
    }
    
    struct Location: Mappable {
        var lat:Double?
        var lon:Double?
        
        init?(map: Map){
            
        }
        
        mutating func mapping(map: Map){
            lat <- map["lat"]
            lon <- map["lon"]
        }
    }
}
