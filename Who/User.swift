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
        self.username = fbResultDict[Name_Key] as? String ?? ""
        self.email = fbResultDict[Email_Key] as? String ?? ""
        self.password = FBSDKAccessToken.currentAccessToken().tokenString
    }
}
