//
//  WYFacebookManager.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

let fbPermissions = ["public_profile", "email", "user_friends"]

func facebookLogin(vc:UIViewController, complete:(outcome: Bool, error: NSError?)->Void) {
    FBSDKLoginManager().logInWithReadPermissions(fbPermissions, fromViewController: vc) { (result, error) -> Void in
        if error != nil {
            complete(outcome: false, error: error)
        } else {
            if  (FBSDKAccessToken.currentAccessToken() != nil) {
                FBSDKGraphRequest(graphPath: "me", parameters:nil).startWithCompletionHandler({ (connection, result, error) -> Void in
                    if  result != nil && error == nil {
                        let res = result as! NSDictionary
                        parseLoginUser(res["name"] as! String, didLogin: { (didLogin) -> Void in
                            if didLogin {
                                complete(outcome: true, error: nil)
                            } else {
                                parseSignUpNewUser(res, complete: { (finished, error) -> Void in
                                    complete(outcome: finished, error: error)
                                })
                            }
                        })
                    } else {
                        complete(outcome: false, error: error)
                    }
                })
            }
        }
    }
}

private func graphRequestForUserInformation() {

}
