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
    @IBOutlet weak var customIconTextField: UITextField!
    @IBOutlet weak var customIconSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        picker.dismiss(animated: true, completion: nil)
//        
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            delegate?.photoSelectViewControllerSelected(image)
//            customIconImage.image = image
//        }
//    }

}
