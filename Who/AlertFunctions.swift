//
//  AlertFunctions.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import Foundation


func showAlertWithTitle(title:String, message: String?, vc: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "CONTINUE", style: .Cancel, handler: nil))
    vc.presentViewController(alert, animated: true, completion: nil)
}