//
//  BackgroundController.swift
//  IconDesign
//
//  Created by Austin Money on 8/22/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit
import CoreData

class BackgroundController {
    
    // MARK: - Properties
    
    static let shared = BackgroundController()
    
    var temporaryBackground: Background?
    
    var background: [Background] {
        let request: NSFetchRequest<Background> = Background.fetchRequest()
    
        let moc = CoreDataStack.context
        
        do {
            return try moc.fetch(request)
        } catch {
            return self.background
        }
    }
    
    var backgroundWithSwitchOn: [Background] {
        return background.filter({$0.isOn})
    }
    
    // MARK: - CRUD
    
    func addBackgroundWith(image: UIImage) {
            
        let imageData = UIImagePNGRepresentation(image)

        let background = Background(imageData: imageData, context: CoreDataStack.context)
        self.temporaryBackground = background
        saveToPersistentStorage()
    }
    
    func remove(background: Background) {
        background.managedObjectContext?.delete(background)
        saveToPersistentStorage()
    }
    
    
    func saveToPersistentStorage() {
        do{
            try CoreDataStack.context.save()
        } catch {
            print ("error saving MOC.")
        }
    }
    
    // MARK: - Helpers
    func imageWithImage(image:UIImage, scaledToSize newSize: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
