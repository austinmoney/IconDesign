//
//  MainViewController.swift
//  IconDesign
//
//  Created by Austin Money on 8/21/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, NSFetchedResultsControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
//    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dockCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchedResultsController.delegate = self
        
        dockCollectionView.delegate = self
        dockCollectionView.dataSource = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            NSLog("Error starting fetched results controller: \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
//        setBackgroundImage()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
         return 1
        } else if collectionView == self.dockCollectionView {
            return 1
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView {
        return IconController.shared.mainIcons.count
        } else if collectionView == self.dockCollectionView {
            return IconController.shared.dockIcons.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as? IconCollectionViewCell else { return UICollectionViewCell() }
        
        let icon = IconController.shared.mainIcons[indexPath.row]
        
        cell.iconImage.image = icon.iconImage
        cell.iconLabel.text = icon.name
            
        
        return cell
        } else if collectionView == self.dockCollectionView {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dockCollectionViewCell", for: indexPath) as? IconCollectionViewCell else { return UICollectionViewCell() }
            
            let icon = IconController.shared.dockIcons[indexPath.row]
            
            cell.dockImage.image = icon.iconImage
            cell.dockLabel.text = icon.name
            return cell
        }
        return UICollectionViewCell()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let fetchedResultsController: NSFetchedResultsController<Icon> = {
        
        let fetchRequest: NSFetchRequest<Icon> = Icon.fetchRequest()
        
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
//    func setBackgroundImage() {
//        guard let background = BackgroundController.shared.background.last else { return }
//        backgroundImage.image = background.backgroundImage
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
