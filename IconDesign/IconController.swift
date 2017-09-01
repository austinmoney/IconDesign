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
    
    var temporaryIcon: Icon?

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
    
    var iconsNotHidden: [Icon] {
        return icons.filter({!$0.isHidden})
    }
    
    static func createMockIcons() {
        
        let _ = Icon(name: "Ball", image: #imageLiteral(resourceName: "Ball"), isCustomIcon: false)
        let _ = Icon(name: "Mail", image: #imageLiteral(resourceName: "Mail"), isCustomIcon: false)
        let _ = Icon(name: "Messages", image: #imageLiteral(resourceName: "Message"), isCustomIcon: false)
        let _ = Icon(name: "Compass", image: #imageLiteral(resourceName: "Compass"), isCustomIcon: false)
        let _ = Icon(name: "Camera", image: #imageLiteral(resourceName: "Camera"), isCustomIcon: false)

        IconController.shared.saveToPersistentStorage()
        
        UserDefaults.standard.set(true, forKey: "mockIconsWereCreated")
    }
    
//    static func createDockIcons() {
//        let _ = Icon(name: "Phone", image: #imageLiteral(resourceName: "phone"), isCustomIcon: false, isDockIcon: true)
//        let _ = Icon(name: "Safari", image: #imageLiteral(resourceName: "safari"), isCustomIcon: false, isDockIcon: true)
//        let _ = Icon(name: "Music", image: #imageLiteral(resourceName: "music"), isCustomIcon: false, isDockIcon: true)
//        let _ = Icon(name: "Messages", image: #imageLiteral(resourceName: "message"), isCustomIcon: false, isDockIcon: true)
//        
//        IconController.shared.saveToPersistentStorage()
//        
//        UserDefaults.standard.set(true, forKey: "dockIconsWereCreated")
//        
//    }
    
    // MARK: - CRUD

//    func add(icon: Icon) {
//        self.temporaryIcon = icon
//        saveToPersistentStorage()
//    }

    func addIcon(with name: String, and image: UIImage) {
        let scaledImage = imageWithImage(image: image, scaledToSize: CGSize.init(width: 90.0, height: 90.0))
        
        let icon = Icon(name: name, image: scaledImage, isCustomIcon: true, context: CoreDataStack.context)
        self.temporaryIcon = icon
        saveToPersistentStorage()
    }
    
    func update(icon: Icon, withText text: String) {
        icon.name = text
        saveToPersistentStorage()
    }
    
    func updateIconSwitch(icon: Icon, valueSelected: Bool) {
        icon.isHidden = valueSelected
        saveToPersistentStorage()
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
    
    // MARK: - Helpers
    
    func imageWithImage(image:UIImage, scaledToSize newSize: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

}
