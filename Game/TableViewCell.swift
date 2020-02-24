//
//  TableViewCell.swift
//  Game
//
//  Created by MAC on 12/02/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblName: UILabel!
    
    
    
    @IBOutlet weak var lblCapital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
