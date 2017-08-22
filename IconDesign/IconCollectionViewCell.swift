//
//  IconCollectionViewCell.swift
//  IconDesign
//
//  Created by Austin Money on 8/15/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    var icon: Icon?
    
    func updateViews() {
        guard let icon = icon else { return }
        self.iconImage.image = icon.iconImage
        self.iconLabel.text = icon.name
        
    }
}
