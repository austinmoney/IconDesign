//
//  DefaultIconTableViewCell.swift
//  IconDesign
//
//  Created by Austin Money on 8/17/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit

class DefaultIconTableViewCell: UITableViewCell {
    
    @IBOutlet weak var defaultIconImage: UIImageView!
    @IBOutlet weak var defaultIconLabel: UILabel!
    @IBOutlet weak var defaultIconSwitch: UISwitch!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
