//
//  OneLineAlertExtension.swift
//  OneLineAlert
//
//  Created by AmebaHead on 18/10/2019.
//  Copyright © 2019 AmebaHead. All rights reserved.
//

import UIKit

extension ViewController {
    
    // Yes
    func yesAlert(title: String?, message: String?, handler: (() -> Void)!) {
        let alertController = OneLineAlertView(title: title, message: message)
        let confirmOption: Option = ("예", .Confirm)
        
        let confirmAction = OneLineAlertAction(option: confirmOption) {
            handler()
        }
        
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Yes or No
    func yesOrNoAlert(title: String?, message: String?, yesHandler: (() -> Void)!, noHandler: (() -> Void)!) {
        let alertController = OneLineAlertView(title: title, message: message)
        let confirmOption: Option = ("예", .Confirm)
        let cancelOption: Option = ("아니오", .Cancel)
        
        let confirmAction = OneLineAlertAction(option: confirmOption) {
            yesHandler()
        }
        let cancelAction = OneLineAlertAction(option: cancelOption) {
            noHandler()
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // opt1 or opt2 or opt3
    func threeOptionAlert(title: String?, message: String?, options: [Option], oneHandler: (() -> Void)!, twoHandler: (() -> Void)!, threeHandler: (() -> Void)!) {
        
        let alertController = OneLineAlertView(title: title, message: message)
        let oneOption = options[safe: 0] ?? ("Option1", .Neutral)
        let twoOption = options[safe: 1] ?? ("Option2", .Neutral)
        let threeOption = options[safe: 2] ?? ("Option3", .Neutral)
        
        let oneOptionAction = OneLineAlertAction(option: oneOption) {
            oneHandler()
        }
        
        let twoOptionAction = OneLineAlertAction(option: twoOption) {
            twoHandler()
        }
        
        let threeOptionAction = OneLineAlertAction(option: threeOption) {
            threeHandler()
        }
        
        alertController.addAction(oneOptionAction)
        alertController.addAction(twoOptionAction)
        alertController.addAction(threeOptionAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
