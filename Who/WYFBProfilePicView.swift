//
//  WYFBProfilePicView.swift
//  Who
//
//  Created by Rich Fellure on 10/1/15.
//  Copyright © 2015 RichFell. All rights reserved.
//

import UIKit

@IBDesignable class WYFBProfilePicView: FBSDKProfilePictureView {

    override func prepareForInterfaceBuilder() {
        backgroundColor = UIColor.grayColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        self.layer.cornerRadius = CGRectGetWidth(self.frame)/2
        self.layer.masksToBounds = true
    }
}
