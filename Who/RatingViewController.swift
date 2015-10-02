//
//  RatingViewController.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reasonTextView: WYTextView!

    var userToRate : User? {
        didSet {
//            newRating.rated = userToRate
//            newRating.rater = User.currentUser()
        }
    }
    
    let newRating = WYRating()
    var rating : NSNumber = 5.0 {
        didSet{
            ratingLabel.text = rating.stringValue
            newRating.rating = rating
        }
    }

    //MARK: Touches
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true)
    }

    //MARK: IBActions
    @IBAction func incrementRating(sender: UIButton) {
        while rating.doubleValue < 5.0 {
            rating = NSNumber(double: rating.doubleValue + 0.5)
        }
    }

    @IBAction func decrementRating(sender: UIButton) {
        while rating.doubleValue > 0.0 {
            rating = NSNumber(double: rating.doubleValue - 0.5)
        }
    }

    @IBAction func saveRating(sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure you want to save this rating?", message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "SAVE", style: .Default, handler: { (action) -> Void in
            parseSaveRating(self.newRating, withReason: self.reasonTextView.text) { (outcome) -> Void in
                if outcome {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    showAlertWithTitle("There was an issue.", message: "Please try to submit again. If it doesn't work make sure that you have data or wifi connection.", vc: self)
                }
            }
        }))
        presentViewController(alert, animated: true, completion: nil)

    }
}


















