//
//  Conversation.swift
//  Binder
//
//  Created by Axel Le Bot on 03/05/2017.
//  Copyright © 2017 iem. All rights reserved.
//

import Foundation

class Conversation: NSObject {
    var id: String?
    var label: String?

    init(id: String, label: String) {
        self.id = id;
        self.label = label;
    }
}
