//
//  ParseFunctions.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import Foundation

func parseSignUpNewUser(newUser: User, complete:(finished:Bool, error:NSError?)->Void) {
    newUser.signUpInBackgroundWithBlock { (outcome, error) -> Void in
        complete(finished: outcome , error: error)
    }
}

func parseSaveObjectInBackground(object:PFObject, complete:(finished:Bool, error:NSError?)->Void){
    object.saveInBackgroundWithBlock { (outcome, error) -> Void in
        complete(finished: outcome, error: error)
    }
}

func parseLoginUser(userName:String, didLogin:(Bool)->Void) {
    User.logInWithUsernameInBackground(userName, password: FBSDKAccessToken.currentAccessToken().tokenString) { (user, error) -> Void in
        didLogin(user != nil ? true : false)
    }
}

func parseUsersMatchingUserIDs(fbIDs:[String], complete: (users: [UserInfo], error: NSError?)->Void) {
    var queries : [PFQuery] = []

    for id in fbIDs {
        let query = UserInfo.query()
        query?.whereKey("fbID", equalTo: id)
        queries.append(query!)
    }
    
    let query = PFQuery.orQueryWithSubqueries(queries)
    query.findObjectsInBackgroundWithBlock { (result, error) -> Void in
        if  let results = result {
            complete(users: results as! [UserInfo], error: nil)
        } else {
            complete(users: [], error: error)
        }
    }
}

func parseSaveRating(rating:WYRating, withReason:String, complete:(Bool)->Void) {
    rating.reason = withReason
    rating.saveInBackgroundWithBlock { (outcome, error) -> Void in
        complete(outcome)
    }
}

func parseCheckIfRatedUser(user:User, complete:(Bool)->Void) {

}









