//
//  CustomGestureRecognizer.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/13/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class CustomGestureRecognizer: UITapGestureRecognizer {
    
    var myView: UIView?
    
     init(target: Any?, action: Selector?, myView: UIView) {
        super.init(target: target, action: action)
        
        self.myView = view
    }
    
    func tapped(sender: CustomGestureRecognizer) {
        myView?.backgroundColor = .red
    }
}
