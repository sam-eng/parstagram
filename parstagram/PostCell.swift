//
//  PostCell.swift
//  parstagram
//
//  Created by Samantha Eng on 11/15/19.
//  Copyright © 2019 Samantha Eng. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
