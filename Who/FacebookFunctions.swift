//
//  WYFacebookManager.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

enum LoginStatus {
    case UserLoggedIn
    case UserSignedUp
    case Failed
}

import UIKit

let fbPermissions = ["public_profile", "email", "user_friends", "user_hometown", "user_location"]

func facebookLogin(vc:UIViewController, complete:(status: LoginStatus, user: User?, userInfo:UserInfo?, error: NSError?)->Void) {
    FBSDKLoginManager().logInWithReadPermissions(fbPermissions, fromViewController: vc) { (result, error) -> Void in
        if error != nil {
            complete(status:.Failed, user: nil, userInfo: nil, error: error)
        } else {
            if  (FBSDKAccessToken.currentAccessToken() != nil) {
                FBSDKGraphRequest(graphPath: "me", parameters:["fields":"id,name,email,location,hometown"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                    if  result != nil && error == nil {
                        let res = result as! NSDictionary
                        parseLoginUser(res["name"] as! String, didLogin: { (didLogin) -> Void in
                            if didLogin {
                                complete(status:LoginStatus.UserLoggedIn, user: User.currentUser(), userInfo:nil, error: nil)
                            } else {
                                let user = User(fbResultDict: res)
                                let userInfo = UserInfo(fbDict: res, user: user)
                                complete(status: LoginStatus.UserSignedUp, user: user, userInfo: userInfo, error: nil)
                            }
                        })
                    } else {
                        complete(status: LoginStatus.Failed, user: nil, userInfo: nil, error: error)
                    }
                })
            }
        }
    }
}

func facebookPullFriendData(complete:(friends:[UserInfo], error:NSError?)->Void) {
    if  FBSDKAccessToken.currentAccessToken().hasGranted("user_friends") {
        let request = FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields": ""], HTTPMethod: "GET")
        request.startWithCompletionHandler({ (requestConnection, result, error) -> Void in
            if result != nil {
                let res = result as! NSDictionary
                if let results = res["data"] as? [NSDictionary]{
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
