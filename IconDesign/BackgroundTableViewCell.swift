//
//  BackgroundTableViewCell.swift
//  IconDesign
//
//  Created by Austin Money on 8/18/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit

class BackgroundTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.isUserInteractionEnabled = false

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
