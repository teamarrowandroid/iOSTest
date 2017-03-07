//
//  TableViewCell.swift
//  ShoppinSite
//
//  Created by harpreet singh on 2017-02-21.
//  Copyright © 2017 assignment2. All rights reserved.
//

// Name- Harpreet Singh
// Student ID - 300912078
// Date - 21 Fab,2017
//Purpose - Mid Term Test

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var listItem: UILabel!
    @IBOutlet weak var itemQ: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}







