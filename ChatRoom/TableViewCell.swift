//
//  TableViewCell.swift
//  ChatRoom
//
//  Created by Hua David on 2019/12/26.
//  Copyright © 2019 darklit. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var avatarUIImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
