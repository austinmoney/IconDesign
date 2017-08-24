//
//  CustomIconTableViewCell.swift
//  IconDesign
//
//  Created by Austin Money on 8/17/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit

class CustomIconTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customIconImage: UIImageView!
    @IBOutlet weak var customIconSwitch: UISwitch!
    @IBOutlet weak var customIconLabel: UILabel!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        customIconTextField.resignFirstResponder()

        return true
    }
    
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

