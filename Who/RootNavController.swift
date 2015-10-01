//
//  RootNavController.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class RootNavController: UINavigationController {


    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.currentUser() == nil {
            self.performSegueWithIdentifier("LoginSegue", sender: nil)
        }
    }
}
