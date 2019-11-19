//
//  ViewController.swift
//  OneLineAlert
//
//  Created by AmebaHead on 15/11/2019.
//  Copyright © 2019 AmebaHead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showYesAlert(_ sender: Any) {
        self.yesAlert(title: " 카드 승인", message: "카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)") {
            print("Yes")
        }
    }
    
    @IBAction func showNoTitleAlert(_ sender: Any) {
        self.yesAlert(title: "", message: "카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)") {
            print("Yes")
        }
    }
    
    @IBAction func showYesOrNoAlert(_ sender: Any) {
        self.yesOrNoAlert(title: " 카드 승인", message: "카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)", yesHandler: {
            print("Yes")
        }) {
            print("No")
        }
    }
    
    @IBAction func showThreeOptionAlert(_ sender: Any) {
        let options: [Option] = [("옵션1", .Neutral), ("옵션2", .Neutral), ("옵션3", .Neutral)]
        self.threeOptionAlert(title: " 카드 승인", message: "카드 단말기에 연결할 수 없습니다.\n 네트웍 연결을 확인 하십시오.\n (작업을 완료할 수 없습니다. \nSwiftSocket.SocketError 오류 3.)", options: options, oneHandler: {
            print("Option1")
        }, twoHandler: {
            print("Option2")
        }) {
            print("Option3")
        }
    }
    
    
    
}

