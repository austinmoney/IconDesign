//
//  Background.swift
//  IconDesign
//
//  Created by Austin Money on 8/22/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit
import CoreData

extension Background {
    
    convenience init(image: UIImage, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        
        let imageData = UIImagePNGRepresentation(image) as NSData?
        self.image = imageData
    }

    var backgroundImage: UIImage? {
        guard let imageData = image as Data? else { return nil }
        
        return UIImage(data: imageData)
    }
}

