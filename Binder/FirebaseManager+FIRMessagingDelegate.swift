//
//  FirebaseManager+FIRMessagingDelegate.swift
//  Binder
//
//  Created by iem on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import Foundation
import FirebaseMessaging

// [START ios_10_data_message_handling]
extension AppDelegate : FIRMessagingDelegate {
    // Receive data message on iOS 10 devices while app is in the foreground.
    func applicationReceivedRemoteMessage(_ remoteMessage: FIRMessagingRemoteMessage) {
        print(remoteMessage.appData)
    }
}
