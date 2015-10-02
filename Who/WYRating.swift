//
//  WYRating.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class WYRating: PFObject, PFSubclassing {

    @NSManaged var rater: User?
    @NSManaged var rated: User?
    @NSManaged var rating: NSNumber?
    @NSManaged var reason: String?

    static func parseClassName() -> String {
        return "WYRating"
    }

}
