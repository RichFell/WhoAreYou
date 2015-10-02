//
//  PhoneVerViewController.swift
//  Who
//
//  Created by Rich Fellure on 10/2/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

protocol PhoneVerVCDelegate {
    func phoneVerVC(vc:PhoneVerViewController, didFinishRegistering finished:Bool)
}

class PhoneVerViewController: UIViewController, UITextFieldDelegate {

    let regAlertTitle = "Sorry there was an issue with your registration"
    let regAlertMessage = "Please verify that you have wifi or data service."

    var newUser : User?
    var userInfo : UserInfo?
    var delegate : PhoneVerVCDelegate?
    var canContinue : Bool = false {
        didSet {
            finishRegButton.hidden = !canContinue
        }
    }
    @IBOutlet weak var finishRegButton: UIButton!

    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        finishRegButton.hidden = true
    }

    //MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.text?.characters.count == 10 {
            guard let number = Double(textField.text!) else {
                canContinue = false
                return
            }
            canContinue = true
            userInfo?.phoneNumber = String(number)
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //MARK: Touches
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        view.endEditing(true)
    }

    @IBAction func finishRegistration(sender: UIButton) {
        parseSignUpNewUser(newUser!) { (finished, error) -> Void in
            if finished {
                parseSaveObjectInBackground(self.userInfo!, complete: { (finished, error) -> Void in
                    if finished {
                        self.delegate?.phoneVerVC(self, didFinishRegistering: true)
                    } else {
                        showAlertWithTitle(self.regAlertTitle, message: self.regAlertMessage, vc: self)
                    }
                })
            } else {
                showAlertWithTitle(self.regAlertTitle, message: self.regAlertMessage, vc: self)
            }
        }
    }
}
