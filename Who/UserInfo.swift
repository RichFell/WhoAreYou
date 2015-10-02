//
//  UserInfo.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class UserInfo: PFObject, PFSubclassing {

    @NSManaged var name: String?
    @NSManaged var phoneNumber: String?
    @NSManaged var avgRating: NSNumber?
    @NSManaged var user: User?
    @NSManaged var fbID: String?
    @NSManaged var location: String?

    static func parseClassName() -> String {
        return "UserInfo"
    }

    convenience init(fbDict: NSDictionary, user: User?) {
        self.init()
        self.name = fbDict[Name_Key] as? String ?? ""
        self.avgRating = 0
        if let aUser = user{
            self.user = aUser
        }
        guard let dict = fbDict[Locaiton_Key] as? NSDictionary else {
            guard let adict = fbDict[Hometown_Key] as? NSDictionary else {
                self.location = ""
                return
            }
            self.location = adict[Name_Key] as? String
            return
        }
        self.location = dict[Name_Key] as? String
    }
}
