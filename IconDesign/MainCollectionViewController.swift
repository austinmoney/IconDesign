////
////  MainCollectionViewController.swift
////  IconDesign
////
////  Created by Austin Money on 8/15/17.
////  Copyright © 2017 Austin Money. All rights reserved.
////
//
//import UIKit
//import CoreData
//
////private let reuseIdentifier = "iconCell"
//
//class MainCollectionViewController: UICollectionViewController, NSFetchedResultsControllerDelegate {
//    
//    // MARK: - Variables
////    var icons: UIImage
////    fileprivate let itemsPerRow: CGFloat = 4
////    let array: [String] = []
//    
//    @IBOutlet weak var backgroundImage: UIImageView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        fetchedResultsController.delegate = self
//        
//        do {
//            try fetchedResultsController.performFetch()
//        } catch {
//            NSLog("Error starting fetched results controller: \(error)")
//        }
// 
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
////        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "iconCell")
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return IconController.shared.mockIcons.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as? IconCollectionViewCell else { return UICollectionViewCell() }
//        
//        let icon = IconController.shared.mockIcons[indexPath.row]
//        
//        cell.iconImage.image = icon.iconImage
//        cell.iconLabel.text = icon.name
//    
//        // Configure the cell
//    
//        return cell
//    }
//
//    // MARK: UICollectionViewDelegate
//
//    /*
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//    
//    }
//    */
//    
//    let fetchedResultsController: NSFetchedResultsController<Icon> = {
//        
//        let fetchRequest: NSFetchRequest<Icon> = Icon.fetchRequest()
//        
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//        
//        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
//    }()
//    
////    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
////        
////        switch type {
////        case .delete:
////            guard let indexPath = indexPath else { return }
////            collectionView.deleteRows(at: [indexPath], with: .automatic)
////        case . insert:
////            guard let newIndexPath = newIndexPath else { return }
////            collectionView.insertRows(at: [newIndexPath], with: .automatic)
////        case .move:
////            guard let indexPath = indexPath,
////                let newIndexPath = newIndexPath else { return }
////            collectionView.moveRow(at: indexPath, to: newIndexPath)
////        case .update:
////            guard let indexPath = indexPath else { return }
////            collectionView.reloadRows(at: [indexPath], with: .automatic)
////        }
////    }
//    
//
//}
