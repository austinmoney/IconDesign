//
//  MainViewController.swift
//  IconDesign
//
//  Created by Austin Money on 8/21/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, NSFetchedResultsControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource, DefaultIconTableViewCellDelegate, CustomIconTableViewCellDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchedResultsController.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            NSLog("Error starting fetched results controller: \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
        setBackgroundImage()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
         return 1
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView {
        return IconController.shared.iconsNotHidden.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as? IconCollectionViewCell else { return UICollectionViewCell() }
        
        let icon = IconController.shared.iconsNotHidden[indexPath.row]
        
        cell.iconImage.image = icon.iconImage
        cell.iconLabel.text = icon.name
        
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
    
    func setBackgroundImage() {
        guard let background = BackgroundController.shared.background.last else { return }
        backgroundImage.image = background.backgroundImage
    }
    
    // MARK: - TableView
    
    // MARK: - Properties
    
    enum imagePicker {
        case iconImage
        
        case background
    }
    
    var imagePickerType = imagePicker.background
    
    weak var delegate: PhotoSelectViewControllerDelegate?
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if imagePickerType == imagePicker.iconImage {
            
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                delegate?.photoSelectViewControllerSelected(image)
                
                let name = ""
                
                IconController.shared.addIcon(with: name, and: image)
                
                self.presentAppNameAlertController()
                tableView.reloadData()
            }
            
        } else if imagePickerType == imagePicker.background {
            
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                delegate?.photoSelectViewControllerSelected(image)
                
                BackgroundController.shared.addBackgroundWith(image: image)
                
                tableView.reloadData()
            }
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Default Icons"
        } else if section == 1 {
            return "Custom Icons"
        } else {
            return "Background"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return IconController.shared.defaultIcons.count
        } else if section == 1 {
            return IconController.shared.customIcons.count + 1
        } else {
            return BackgroundController.shared.background.count + 1
        }
    }
    
    //    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //        cell.backgroundColor = UIColor(red: 3/255, green: 10/255, blue: 200/255, alpha: 1)
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "defaultIconCell", for: indexPath) as? DefaultIconTableViewCell else { return UITableViewCell() }
            
            let icon = IconController.shared.defaultIcons[indexPath.row]
            
            cell.defaultIconImage.image = icon.iconImage
            cell.defaultIconLabel.text = icon.name
            cell.defaultIconSwitch.isOn = !icon.isHidden
            cell.delegate = self
            
            return cell
            
        } else if indexPath.section == 1 {
            
            if indexPath.row == IconController.shared.customIcons.count {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "newIconCell", for: indexPath) as? NewIconTableViewCell else { return UITableViewCell() }
                
                return cell
            } else {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "customIconCell", for: indexPath) as? CustomIconTableViewCell else { return UITableViewCell() }
                
                //            guard IconController.shared.customIcons.count > 0 else { return cell }
                
                let icon = IconController.shared.customIcons[indexPath.row]
                
                cell.customIconImage.image = icon.iconImage
                cell.customIconLabel.text = icon.name
                cell.customIconSwitch.isOn = !icon.isHidden
                cell.delegate = self
                
                return cell
            }
        } else if indexPath.section == 2 {
            if indexPath.row == BackgroundController.shared.background.count {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "newIconCell", for: indexPath) as? NewIconTableViewCell else { return UITableViewCell() }
                
                return cell
            } else {
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "backgroundCell", for: indexPath) as? BackgroundTableViewCell else { return UITableViewCell() }
                
                let background = BackgroundController.shared.background[indexPath.row]
                
                cell.backgroundImage.image = background.backgroundImage
                
                return cell
            }
        }
        else  { return UITableViewCell() }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        } else if indexPath.section == 1 && indexPath.row == IconController.shared.customIcons.count {
            presentAppImageAlertController()
        } else if indexPath.section == 2 && indexPath.row == BackgroundController.shared.background.count {
            presentBackgroundAlertController()
        }
    }
    
    // MARK: - App Name UIAlertController
    func presentAppNameAlertController() {
        
        var ACTextField: UITextField?
        
        let alert1 = UIAlertController(title: "App Name", message: "Enter App Name", preferredStyle: .alert)
        
        alert1.addTextField { (textField) in textField.placeholder = "App Name"
            ACTextField = textField
            
        }
        
        alert1.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) -> Void in
            
            guard let icon = IconController.shared.temporaryIcon else { return }
            if let name = ACTextField?.text {
                IconController.shared.update(icon: icon, withText: name)
                self.tableView.reloadData()
                self.collectionView.reloadData()
            }
            
        }))
        //        alert1.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert1, animated: true, completion: nil)
        
        
    }
    
    
    // MARK: - App image UIAlertController
    
    func presentAppImageAlertController() {
        imagePickerType = .iconImage
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alert2 = UIAlertController(title: "Select Image", message: "Photo Library", preferredStyle: .alert)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alert2.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) -> Void in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        
        alert2.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert2, animated: true, completion: nil)
    }
    
    // MARK: - Background UIAlertController
    
    func presentBackgroundAlertController() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePickerType = .background
        
        let alert = UIAlertController(title: "Change Background", message: "Photo Library", preferredStyle: .alert)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) -> Void in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    // Override to support conditional editing of the table view.
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        
        switch indexPath.section {
            
        case 0:
            return false
            
        case 1:
            
            if indexPath.row == IconController.shared.customIcons.count {
                return false
            } else {
                return true
            }
            
        case 2:
            if indexPath.row == BackgroundController.shared.background.count {
                return false
            } else {
                return true
            }
            
        default:
            return true
        }
    }
    
    
    
    // Override to support editing the table view.
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if indexPath.section == 1 {
                
                let icon = IconController.shared.customIcons[indexPath.row]
                IconController.shared.remove(icon: icon)
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.collectionView.reloadData()
                
            } else if indexPath.section == 2 {
                let background = BackgroundController.shared.background[indexPath.row]
                BackgroundController.shared.remove(background: background)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.collectionView.reloadData()
            }
        }
    }
    
    func iconIsHiddenValueDidChange(cell: DefaultIconTableViewCell, selectedValue: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let icon = IconController.shared.defaultIcons[indexPath.row]
        
        IconController.shared.updateIconSwitch(icon: icon, valueSelected: selectedValue)
        
        self.collectionView.reloadData()
    }
    
    func customIconIsHiddenValueDidChange(cell: CustomIconTableViewCell, selectedValue: Bool) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let icon = IconController.shared.customIcons[indexPath.row]
        
        IconController.shared.updateIconSwitch(icon: icon, valueSelected: selectedValue)
        
        self.collectionView.reloadData()
    }
    
    
}

protocol PhotoSelectViewControllerDelegate: class {
    func photoSelectViewControllerSelected(_ image: UIImage)
}

