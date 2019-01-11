//
//  CustomTableViewCell.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/10/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var genreLabel: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "reuseIdentifier")
        
        let cellLabelPosition = self.frame.width / 1.5
        let cellLabelHeight = self.frame.height * 1.55
        genreLabel = UILabel(frame: CGRect(x: cellLabelPosition, y: 0, width: self.frame.width, height: cellLabelHeight))
        genreLabel.textColor = .lightGray
        addSubview(genreLabel)
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
    
    //    func cellImageViewConstraint() {
    //        cellImageView.translatesAutoresizingMaskIntoConstraints = false
    //        cellImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    //    }
}
