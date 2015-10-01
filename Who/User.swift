//
//  User.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class User: PFUser {

    convenience init(fbResultDict:NSDictionary) {
        self.init()
        self.username = fbResultDict["name"] as? String ?? ""
        self.email = fbResultDict["email"] as? String ?? ""
        self.password = FBSDKAccessToken.currentAccessToken().tokenString
    }
}
