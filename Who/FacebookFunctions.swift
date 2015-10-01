//
//  WYFacebookManager.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

let fbPermissions = ["public_profile", "email", "user_friends", "user_hometown", "user_location"]

func facebookLogin(vc:UIViewController, complete:(outcome: Bool, error: NSError?)->Void) {
    FBSDKLoginManager().logInWithReadPermissions(fbPermissions, fromViewController: vc) { (result, error) -> Void in
        if error != nil {
            complete(outcome: false, error: error)
        } else {
            if  (FBSDKAccessToken.currentAccessToken() != nil) {
                FBSDKGraphRequest(graphPath: "me", parameters:["fields":"id,name,email,location,hometown"]).startWithCompletionHandler({ (connection, result, error) -> Void in
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

func facebookPullFriendData(complete:(friends:[User], error:NSError?)->Void) {
    if  FBSDKAccessToken.currentAccessToken().hasGranted("user_friends") {
        let request = FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields": ""], HTTPMethod: "GET")
        request.startWithCompletionHandler({ (requestConnection, result, error) -> Void in
            if result != nil {
                let res = result as! NSDictionary
                print(res)
                if let results = res["data"] as? [NSDictionary]{
                    print(results)
                    var ids : [String] = []
                    for dict in results {
                        ids.append(dict["id"] as! String)
                    }
                    parseUsersMatchingUserIDs(ids, complete: { (users, error) -> Void in

                        complete(friends: users, error: error)
                    })
                }
            }
        })
    }
}
