//
//  TableViewCell.swift
//  coredataDemo
//
//  Created by Harshil sureshbhai dobariya on 10/01/19.
//  Copyright © 2019 Harshil sureshbhai dobariya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var spacialityLBL: UILabel!
    @IBOutlet weak var ageLBL: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
