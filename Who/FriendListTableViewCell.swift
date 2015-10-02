//
//  FriendListTableViewCell.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class FriendListTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicView: WYFBProfilePicView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!

    var userInfo : UserInfo? {
        didSet{
            profilePicView.profileID = userInfo?.fbID
            nameLabel?.text = userInfo?.name
            hometownLabel.text = userInfo?.location
        }
    }

    class func cellID()->String {
        return "FriendsCell"
    }

}
