//
//  UserRepository.swift
//  Binder
//
//  Created by iem on 11/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import Foundation
import ObjectMapper

class UserRepository {
    
    private static let category = "users"
    
    static func getUserById(id: String) -> User {
        var user: User = User()
        FirebaseManager.sharedInstance.getFirebaseReference().child(category).child(id).observe(.value, with: {
            snapshot in
            let jsonObject = snapshot.value as? [String : AnyObject]
            user = Mapper<User>().map(JSONObject: jsonObject)!
        })
        return user
    }
    
    static func getAllUser(maxNumberOfUser: Int) -> [User] {
        var user: [User] = []
        FirebaseManager.sharedInstance.getFirebaseReference().child(category).observe(.value, with: {
            snapshot in
            let jsonObject = snapshot.value as? [[String : AnyObject]]
            user = Mapper<User>().mapArray(JSONObject: jsonObject)!
        })
        return user
    }
    
    
}
