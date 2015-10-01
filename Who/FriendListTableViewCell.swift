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

    var user : User? {
        didSet{
            profilePicView.profileID = user?.fbID
            nameLabel?.text = user?.username
            hometownLabel.text = user?.location
        }
    }

}
