////
////  BackgroundController.swift
////  IconDesign
////
////  Created by Austin Money on 8/22/17.
////  Copyright © 2017 Austin Money. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class BackgroundController {
//    
//    static let shared = BackgroundController()
//    
//    var background: Background {
//        let request: NSFetchRequest<Background> = Background.fetchRequest()
//        
//        do {
//            return try CoreDataStack.context.fetch(request)
//        } catch {
//            return self.background
//        }
//    }
//}
