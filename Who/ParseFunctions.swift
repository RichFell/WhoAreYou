//
//  ParseFunctions.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import Foundation

func loginNewUser(facebookResultDict:NSDictionary, complete:(finished:Bool, error:NSError?)->Void) {
    let user = User(fbResultDict: facebookResultDict)
    user.signUpInBackgroundWithBlock { (outcome, error) -> Void in
        complete(finished: outcome , error: error)
    }
}