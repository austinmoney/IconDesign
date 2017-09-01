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
    
    weak var delegate: DefaultIconTableViewCellDelegate?
    
    var icon: Icon? {
        didSet {
            guard let unwrappedIcon = icon else { return }
            defaultIconSwitch.isOn = unwrappedIcon.isHidden
            defaultIconLabel.text = unwrappedIcon.name
            defaultIconImage.image = unwrappedIcon.iconImage
        }
    }
    
    @IBAction func switchValueDidChange(_ sender: UISwitch) {
        delegate?.iconIsHiddenValueDidChange(cell: self, selectedValue: !defaultIconSwitch.isOn)
        
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

protocol DefaultIconTableViewCellDelegate: class {
    func iconIsHiddenValueDidChange(cell: DefaultIconTableViewCell, selectedValue: Bool)
}
