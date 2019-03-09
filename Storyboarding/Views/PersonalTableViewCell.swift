//
//  PersonalTableViewCell.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 3/9/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {
    
    var cellTextView: UITextView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        cellTextView = UITextView()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // set the frame of the textView
        cellTextView.font = UIFont.init(name: "Times New Roman", size: 18)
//        cellTextView.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 200)
        contentView.addSubview(cellTextView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
