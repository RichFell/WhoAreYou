//
//  User.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class User: PFUser {

    @NSManaged var location : String?
    @NSManaged var fbID : String?

    convenience init(fbResultDict:NSDictionary) {
        self.init()
        self.username = fbResultDict[Name_Key] as? String ?? ""
        self.fbID = fbResultDict[ID_Key] as? String
        self.email = fbResultDict[Email_Key] as? String ?? ""
        self.password = FBSDKAccessToken.currentAccessToken().tokenString
        let dict = fbResultDict[Locaiton_Key] as! NSDictionary
        let homeDict = fbResultDict[Hometown_Key] as! NSDictionary
        self.location = dict[Name_Key] as? String ?? homeDict[Name_Key] as? String ?? ""
    }
}
