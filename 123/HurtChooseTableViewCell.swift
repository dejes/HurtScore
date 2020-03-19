//
//  HurtChooseTableViewCell.swift
//  123
//
//  Created by Jack Liu on 2020/3/10.
//  Copyright © 2020 Jack Liu. All rights reserved.
//

import UIKit

class HurtChooseTableViewCell: UITableViewCell {

    @IBOutlet weak var HurtScore: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
