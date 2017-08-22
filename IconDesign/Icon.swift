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

//    var name: String?
//    var image: UIImage?

// MARK: - Keys
//    private let nameKey = "name"
//    private let imageKey = "image"
//
//    init(name: String, image: UIImage) {
//        self.name = name
//        self.image = image
//    }
//
//    init?(dictionary: [String: Any]) {
//            if let image = dictionary[imageKey] as? UIImage,
//                let name = dictionary[nameKey] as? String {
//
//            self.name = name
//            self.image = image
//        } else {
//            return nil
//        }
//    }
//
//    var dictionaryRepresentation: [String: Any] {
//
//        var dictionary: [String: Any] = [imageKey: nameKey]
//
//        if let image = image, let name = name {
//            dictionary[imageKey] = image
//            dictionary[nameKey] = name
//        }
//
//        return dictionary
//    }
//}
//
//func == (lhs: Icon, rhs: Icon) -> Bool {
//    if lhs.name != rhs.name { return false }
//    if lhs.image != rhs.image { return false }
//
//    return true
//}
