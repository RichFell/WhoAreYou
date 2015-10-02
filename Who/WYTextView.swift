//
//  WYTextView.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

@IBDesignable class WYTextView: UITextView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    func setup() {
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1.0
    }

}
