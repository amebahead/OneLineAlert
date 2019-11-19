//
//  OneLineAlert+Configure.swift
//  OneLineAlert
//
//  Created by AmebaHead on 18/11/2019.
//  Copyright © 2019 AmebaHead. All rights reserved.
//

import Foundation
import UIKit

class OneLineAlertConfigure {
    static let shared = OneLineAlertConfigure()
    
    var overlayColor: UIColor
    
    var alertViewBgColor: UIColor
    var alertViewWidth: CGFloat
    var alertViewHeight: CGFloat
    var alertViewPadding: CGFloat
    var innerContentWidth: CGFloat
    
    var separateLineHeight: CGFloat
    
    var titleTextColor: UIColor
    var titleTextSize: UIFont
    
    var messageTextColor: UIColor
    var messageTextSize: UIFont
    
    var buttonHeight: CGFloat
    var buttonMargin: CGFloat
    
    var alertViewMaxHeight: CGFloat
    
    
    // Default Settings
    init() {
        self.overlayColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.alertViewBgColor = UIColor(hex: "FFFFFF")
        self.alertViewWidth = 400.0
        self.alertViewHeight = 200.0
        self.alertViewPadding = 13.0
        self.innerContentWidth = 340.0
        self.separateLineHeight = 2.0
        self.titleTextColor = UIColor(hex: "3d454c")
        self.titleTextSize = UIFont.boldSystemFont(ofSize: 24)
        self.messageTextColor = UIColor(hex: "3d454c")
        self.messageTextSize = UIFont.systemFont(ofSize: 16)
        self.buttonHeight = 50.0
        self.buttonMargin = 0.0
        self.alertViewMaxHeight = 600.0
    }
}
