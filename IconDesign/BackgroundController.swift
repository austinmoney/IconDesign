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
    
    static let shared = BackgroundController()
    
    var background: [Background] {
        let request: NSFetchRequest<Background> = Background.fetchRequest()
    
        let moc = CoreDataStack.context
        
        do {
            return try moc.fetch(request)
        } catch {
            return self.background
        }
    }
    
    func add(image: UIImage) {
        let background = Background(image: image, context: CoreDataStack.context)
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
}
