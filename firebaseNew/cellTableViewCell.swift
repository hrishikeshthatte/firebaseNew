//
//  cellTableViewCell.swift
//  firebaseNew
//
//  Created by Felix-ITS 004 on 17/12/18.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet var lbldata1: UILabel!
    
    @IBOutlet var lbldata2: UILabel!
    
    @IBOutlet var lbldata3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
