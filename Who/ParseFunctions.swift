//
//  ParseFunctions.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import Foundation

func parseSignUpNewUser(facebookResultDict:NSDictionary, complete:(finished:Bool, error:NSError?)->Void) {
    let user = User(fbResultDict: facebookResultDict)
    user.signUpInBackgroundWithBlock { (outcome, error) -> Void in
        complete(finished: outcome , error: error)
    }
}

func parseLoginUser(userName:String, didLogin:(Bool)->Void) {
    User.logInWithUsernameInBackground(userName, password: FBSDKAccessToken.currentAccessToken().tokenString) { (user, error) -> Void in
        didLogin(user != nil ? true : false)
    }
}