//
//  Main.swift
//  IconDesign
//
//  Created by Austin Money on 8/15/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit
import CoreData

extension Icon {
    
    convenience init(name: String, image: UIImage, isCustomIcon: Bool = true, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        let imageData = UIImagePNGRepresentation(image) as NSData?
        self.image = imageData
        self.isCustomIcon = isCustomIcon
    }
    
    var iconImage: UIImage? {
        
        guard let imageData = image as Data? else { return nil }
        
        return UIImage(data: imageData)
    }
    
}

