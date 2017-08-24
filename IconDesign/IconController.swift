//
//  MainController.swift
//  IconDesign
//
//  Created by Austin Money on 8/15/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit
import CoreData

class IconController {

    // MARK: - Properties

    static let shared = IconController()
    
//    var icon: Icon? {
//        didSet {
//            update()
//        }
//    }

    var icons: [Icon] {
        
        let request: NSFetchRequest<Icon> = Icon.fetchRequest()
        
        do {
            return try CoreDataStack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    
    var customIcons: [Icon] {
        return icons.filter({$0.isCustomIcon})
    }
    
    var defaultIcons: [Icon] {
        return icons.filter({!$0.isCustomIcon})
    }
    
//    var allIcons: [Icon] = []
 
    
    static func createMockIcons() {
        
        let _ = Icon(name: "Snapchat", image: #imageLiteral(resourceName: "snapchat"), isCustomIcon: false)
        let _ = Icon(name: "Facebook", image: #imageLiteral(resourceName: "fb"), isCustomIcon: false)
        let _ = Icon(name: "Medium", image: #imageLiteral(resourceName: "medium"), isCustomIcon: false)
        let _ = Icon(name: "Settings", image: #imageLiteral(resourceName: "settings"), isCustomIcon: false)
        let _ = Icon(name: "Mail", image: #imageLiteral(resourceName: "Mail"), isCustomIcon: false)
        let _ = Icon(name: "Stock", image: #imageLiteral(resourceName: "stock"), isCustomIcon: false)

        IconController.shared.saveToPersistentStorage()
        
        UserDefaults.standard.set(true, forKey: "mockIconsWereCreated")
        
    }
    
    // MARK: - CRUD
    
//    func add(name: String, image: UIImage) {
//        let icon = Icon(name: name, image: image)
//        saveToPersistentStorage()
//    }
    func add(icon: Icon) {
        saveToPersistentStorage()
    }
    
//    func update() {
////        guard let icon = icon else { return }
////        self.iconImage.image = icon.iconImage
////        self.iconLabel.text = icon.name
//        guard let icon = self.icon else { return }
//        
//        icon.name = name =
//        
//        saveToPersistentStorage()
//    }

    func remove(icon: Icon) {
        icon.managedObjectContext?.delete(icon)
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
