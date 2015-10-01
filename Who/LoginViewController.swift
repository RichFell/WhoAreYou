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
        loginWithFacebook(self) { (token, error) -> Void in

        }
    }
}

