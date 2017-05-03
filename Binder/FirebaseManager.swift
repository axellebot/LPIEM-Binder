//
//  FirebaseManager.swift
//  Binder
//
//  Created by iem on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

class FirebaseManager: NSObject {
    static let sharedInstance = FirebaseManager()
    private var ref: FIRDatabaseReference!
    let gcmMessageIDKey = "gcm.message_id"
    
    private override init() {
        ref = FIRDatabase.database().reference()
    }
    
    
    func registerForRemoteNotification(application: UIApplication){
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = FirebaseManager.sharedInstance
    
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
    
            // For iOS 10 data message (sent via FCM)
            FIRMessaging.messaging().remoteMessageDelegate = FirebaseManager.sharedInstance as? FIRMessagingDelegate
    
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
    
        application.registerForRemoteNotifications()
    }
    
    func getFirebaseReference() -> FIRDatabaseReference{
        return ref;
    }
}


