//
//  CustomUIView.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/13/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Need to access tableview to grab proper frame, not quite sure how to implement properly
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
