//
//  FriendDetailViewController.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var ratings : [WYRating] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var avgRatingLabel: UILabel!
    @IBOutlet weak var profilePicView: WYFBProfilePicView!


    //MARK: LifeCycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratings.count
    }
    //MARK: UITableViewDelegate

    //MARK: Actions
    @IBAction func createRating(sender: AnyObject) {
        performSegueWithIdentifier("RatingSegue", sender: nil)
    }

}
