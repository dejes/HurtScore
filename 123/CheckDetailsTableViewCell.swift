//
//  CheckDetailsTableViewCell.swift
//  123
//
//  Created by Jack Liu on 2020/4/7.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit

class CheckDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var HScore: UILabel!
    @IBOutlet weak var HTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
