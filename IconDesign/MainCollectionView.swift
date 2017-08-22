////
////  MainCollectionView.swift
////  IconDesign
////
////  Created by Austin Money on 8/21/17.
////  Copyright © 2017 Austin Money. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class MainCollectionView: UICollectionView, NSFetchedResultsControllerDelegate {
//    
//    // MARK: - Variables
//    //    var icons: UIImage
//    //    fileprivate let itemsPerRow: CGFloat = 4
//    //    let array: [String] = []
//    
//    @IBOutlet weak var backgroundImage: UIImageView!
//    
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using [segue destinationViewController].
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//    // MARK: UICollectionViewDataSource
//    
//    override var numberOfSections: Int {
//        return 1
//    }
//
////    override func numberOfItems(inSection section: Int) -> Int {
////        return IconController.shared.mockIcons.count
////    }
//    
////    override func numberOfItems(inSection section: Int) -> Int {
////        return IconController.shared.mockIcons.count
////    }
////    
////    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
////
////        guard let cell = self.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as? IconCollectionViewCell else { return UICollectionViewCell() }
////        
////        let icon = IconController.shared.mockIcons[indexPath.row]
////        
////        cell.iconImage.image = icon.iconImage
////        cell.iconLabel.text = icon.name
////        
////        // Configure the cell
////        
////        return cell
////    }
//    
//    // MARK: UICollectionViewDelegate
//    
//    /*
//     // Uncomment this method to specify if the specified item should be highlighted during tracking
//     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//     return true
//     }
//     */
//    
//    /*
//     // Uncomment this method to specify if the specified item should be selected
//     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//     return true
//     }
//     */
//    
//    /*
//     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//     return false
//     }
//     
//     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//     return false
//     }
//     
//     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//     
//     }
//     */
//    
//    //    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//    //
//    //        switch type {
//    //        case .delete:
//    //            guard let indexPath = indexPath else { return }
//    //            collectionView.deleteRows(at: [indexPath], with: .automatic)
//    //        case . insert:
//    //            guard let newIndexPath = newIndexPath else { return }
//    //            collectionView.insertRows(at: [newIndexPath], with: .automatic)
//    //        case .move:
//    //            guard let indexPath = indexPath,
//    //                let newIndexPath = newIndexPath else { return }
//    //            collectionView.moveRow(at: indexPath, to: newIndexPath)
//    //        case .update:
//    //            guard let indexPath = indexPath else { return }
//    //            collectionView.reloadRows(at: [indexPath], with: .automatic)
//    //        }
//    //    }
//    
//    
//}
