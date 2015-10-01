//
//  ViewController.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginToFacebook(sender: AnyObject) {
        facebookLogin(self) { (token, error) -> Void in
            if error != nil {
                showAlertWithTitle("Sorry there was an issue with your login", message: "Please verify you are connected to either wifi, or data, then try to log in again.", vc: self)
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
}

