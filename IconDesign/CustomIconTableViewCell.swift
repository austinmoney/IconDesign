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
    
    weak var delegate: CustomIconTableViewCellDelegate?
    
    var icon: Icon? {
        didSet {
            guard let unwrappedIcon = icon else { return }
            customIconLabel.text = unwrappedIcon.name
            customIconImage.image = unwrappedIcon.iconImage
            customIconSwitch.isOn = unwrappedIcon.isHidden
        }
    }
    
    @IBAction func valueDidChange(_ sender: UISwitch) {
        delegate?.customIconIsHiddenValueDidChange(cell: self, selectedValue: !customIconSwitch.isOn)

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        customIconTextField.resignFirstResponder()

        return true
    }
    
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

protocol CustomIconTableViewCellDelegate: class {
    func customIconIsHiddenValueDidChange(cell: CustomIconTableViewCell, selectedValue: Bool)
}
