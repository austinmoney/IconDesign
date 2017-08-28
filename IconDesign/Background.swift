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
    
    convenience init(imageData: Data?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
    
        self.image = imageData as NSData?
    }

    var backgroundImage: UIImage? {
        guard let imageData = image as Data? else { return nil }
        
        return UIImage(data: imageData)
    }
}

