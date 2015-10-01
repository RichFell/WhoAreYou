//
//  FriendsListViewController.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var friends : [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if User.currentUser() != nil {
            facebookPullFriendData({ (friends, error) -> Void in
                self.friends = friends
            })
        }
    }

    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(FriendListTableViewCell.cellID()) as! FriendListTableViewCell
        let friend = friends[indexPath.row]
        cell.user = friend
        return cell
    }

    //MARK: UITableViewDelegate
}
