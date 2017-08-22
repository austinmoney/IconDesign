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

//    @IBOutlet weak var mainCollectionView: MainCollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            NSLog("Error starting fetched results controller: \(error)")
        }
        
        
        
        
//        func numberOfItems(inSection section: Int) -> Int {
//            return IconController.shared.mockIcons.count
//        }
//        
//        func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
//            
//            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as? IconCollectionViewCell else { return UICollectionViewCell() }
//            
//            let icon = IconController.shared.mockIcons[indexPath.row]
//            
//            cell.iconImage.image = icon.iconImage
//            cell.iconLabel.text = icon.name
//            
//            // Configure the cell
//            
//            return cell
//        }

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "iconCell")
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return IconController.shared.mockIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as? IconCollectionViewCell else { return UICollectionViewCell() }
        
        let icon = IconController.shared.mockIcons[indexPath.row]
        
        cell.iconImage.image = icon.iconImage
        cell.iconLabel.text = icon.name
        
        return cell
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
