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

func parseUsersMatchingUserIDs(userIDs:[String], complete: (users: [User], error: NSError?)->Void) {
    var queries : [PFQuery] = []

    for id in userIDs {
        let query = User.query()
        query?.whereKey("fbID", equalTo: id)
        queries.append(query!)
    }
    
    let query = PFQuery.orQueryWithSubqueries(queries)
    query.findObjectsInBackgroundWithBlock { (result, error) -> Void in
        if  let results = result {
            complete(users: results as! [User], error: nil)
        } else {
            complete(users: [], error: error)
        }
    }
}