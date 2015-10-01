//
//  WYFacebookManager.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

let fbPermissions = ["public_profile", "email", "user_friends"]

func loginWithFacebook(vc:UIViewController, complete:(token: String, error: NSError?)->Void) {
    FBSDKLoginManager().logInWithReadPermissions(fbPermissions, fromViewController: vc) { (result, error) -> Void in
        if error != nil {
            complete(token: "", error: error)
        } else {
            //TODO: Check to see if the user is a registered user on Parse.
            if  (FBSDKAccessToken.currentAccessToken() != nil) {
                FBSDKGraphRequest(graphPath: "me", parameters: nil).startWithCompletionHandler({ (connection, result, error) -> Void in
                    
                    
                })
            }
        }
    }
}

private func graphRequestForUserInformation() {

}
