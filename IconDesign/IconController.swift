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

    var icons: [Icon] {
        
        let request: NSFetchRequest<Icon> = Icon.fetchRequest()
        
        do {
            return try CoreDataStack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    var mockIcons: [Icon] {
        
        let snapchat = Icon(name: "Snapchat", image: #imageLiteral(resourceName: "snapchat"))
        let facebook = Icon(name: "Facebook", image: #imageLiteral(resourceName: "fb"))
        let medium = Icon(name: "Medium", image: #imageLiteral(resourceName: "medium"))
        let settings = Icon(name: "Settings", image: #imageLiteral(resourceName: "settings"))
        let mail = Icon(name: "Mail", image: #imageLiteral(resourceName: "Mail"))
        let stock = Icon(name: "Stock", image: #imageLiteral(resourceName: "stock"))
        
        return [snapchat, facebook, medium, settings, mail, stock]
    }
    
    var customIcons: [Icon] {
        
        return []
    }
    
    static func createMockIcons(iconArray: [Icon]) {
        UserDefaults.standard.set(true, forKey: "mockIconsWereCreated")
        
    }
    
    // MARK: - CRUD
    
//    func add(name: String, image: UIImage) {
//        let icon = Icon(name: name, image: image)
//        saveToPersistentStorage()
//    }
    func add(icon: Icon) {
        saveToPersistentStorage()
//        customIcons.append(icon)
    }

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
