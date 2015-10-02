//
//  ViewController.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, PhoneVerVCDelegate {

    let phoneSegue = "PhoneVerSegue"
    var newUser : User?
    var newUserInfo: UserInfo?

    //MARK: LifeCycle
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let vc = segue.destinationViewController as? PhoneVerViewController else{
            return
        }
        vc.newUser = self.newUser
        vc.userInfo = newUserInfo
    }

    //MARK: Actions
    @IBAction func loginToFacebook(sender: AnyObject) {
        facebookLogin(self) { (status, user, userInfo, error) -> Void in
            print("well it hit")
            switch status {
                case .UserLoggedIn:
                    self.dismissViewControllerAnimated(true, completion: nil)
                case .UserSignedUp:
                    self.newUser = user
                    self.newUserInfo = userInfo
                    self.performSegueWithIdentifier(self.phoneSegue, sender: nil)
                case .Failed:
                    print(error?.localizedDescription)
                    showAlertWithTitle("Sorry there was an issue with your login", message: "Please verify you are connected to either wifi, or data, then try to log in again.", vc: self)
            }
        }
    }

    //MARK: PhoneVerVCDelegate
    func phoneVerVC(vc: PhoneVerViewController, didFinishRegistering finished: Bool) {
        dismissViewControllerAnimated(false, completion: nil)
    }
}

