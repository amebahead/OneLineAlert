//
//  OneLineAlertAction.swift
//  OneLineAlert
//
//  Created by AmebaHead on 16/10/2019.
//  Copyright © 2019 AmebaHead. All rights reserved.
//

import Foundation
enum OneLineAlertActionType {
    case Confirm
    case Neutral
    case Cancel
}

typealias Option = (title: String, type: OneLineAlertActionType)
class OneLineAlertAction: NSObject {
    var title: String
    var type: OneLineAlertActionType
    var handler: (() -> Void)!
    
    init(option: Option, handler: (() -> Void)!) {
        self.title = option.title
        self.type = option.type
        self.handler = handler
    }
}
