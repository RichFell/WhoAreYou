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
        guard let dict = fbResultDict[Locaiton_Key] as? NSDictionary else {
            guard let adict = fbResultDict[Hometown_Key] as? NSDictionary else {
                self.location = ""
                return
            }
            self.location = adict[Name_Key] as? String
            return
        }
        self.location = dict[Name_Key] as? String
    }
}
