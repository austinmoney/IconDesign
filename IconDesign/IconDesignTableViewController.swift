//
//  IconDesignTableViewController.swift
//  IconDesign
//
//  Created by Austin Money on 8/17/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit

class IconDesignTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Properties
    
    // Enum with two cases. One for if the image is for an icon, and one for if it's the background image.
    enum imagePicker {
        case iconImage
        
        case background
    }
    
    // Variable of the type of your enum
    
    var imagePickerType = imagePicker.background
    
    weak var delegate: PhotoSelectViewControllerDelegate?
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "#selector")
//        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Default Icons"
        } else if section == 1 {
            return "Custom Icons"
        } else {
            return "Background"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "defaultIconCell", for: indexPath) as? DefaultIconTableViewCell else { return UITableViewCell() }
            
            let icon = IconController.shared.defaultIcons[indexPath.row]
            
            cell.defaultIconImage.image = icon.iconImage
            cell.defaultIconLabel.text = icon.name
            
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
//                cell.customIconSwitch.isOn = icon.isHidden
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        } else if indexPath.section == 1 {
            presentAppImageAlertController()
        } else if indexPath.section == 2 {
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
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     
        
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if indexPath.section == 1 {
                
                let icon = IconController.shared.customIcons[indexPath.row]
                IconController.shared.remove(icon: icon)
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if indexPath.section == 2 {
                let background = BackgroundController.shared.background[indexPath.row]
                BackgroundController.shared.remove(background: background)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
 

}

protocol PhotoSelectViewControllerDelegate: class {
    func photoSelectViewControllerSelected(_ image: UIImage)
}
