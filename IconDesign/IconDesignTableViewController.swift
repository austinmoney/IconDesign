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
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if imagePickerType == imagePicker.iconImage {
            
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                delegate?.photoSelectViewControllerSelected(image)
                
                
                // Make a new instance of Icon.
                let icon = Icon(name: "", image: image, context: CoreDataStack.context)
                IconController.shared.add(icon: icon)
            }
            
        } else if imagePickerType == imagePicker.background {
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                delegate?.photoSelectViewControllerSelected(image)
                
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            return IconController.shared.mockIcons.count
        } else if section == 1 {
            return IconController.shared.customIcons.count + 1
        } else {
            return 1
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "defaultIconCell", for: indexPath) as? DefaultIconTableViewCell else { return UITableViewCell() }
            
            let icon = IconController.shared.mockIcons[indexPath.row]
            
            cell.defaultIconImage.image = icon.iconImage
            cell.defaultIconLabel.text = icon.name
            
            return cell
            
        } else if indexPath.section == 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "customIconCell", for: indexPath) as? CustomIconTableViewCell else { return UITableViewCell() }
            
//            let icon = IconController.shared.customIcons[indexPath.row]
//            
//            cell.customIconImage.image = icon.iconImage
//            cell.customIconTextField.text = icon.name
            if indexPath.row == IconController.shared.customIcons.count {
                guard let _ = tableView.dequeueReusableCell(withIdentifier: "newIconCell", for: indexPath) as? NewIconTableViewCell else { return UITableViewCell() }
            }
            
            return cell
        } else if indexPath.section == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "backgroundCell", for: indexPath)
            
            // Configure the cell...
            
            return cell
        }
        else  { return UITableViewCell() }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        } else if indexPath.section == 1 && indexPath.row == IconController.shared.customIcons.count {
            imagePickerType = .iconImage
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            
            let alert = UIAlertController(title: "Select Image", message: "Photo Library", preferredStyle: .alert)
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) -> Void in
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true, completion: nil)
                }))
            }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
        
        } else {
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
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol PhotoSelectViewControllerDelegate: class {
    func photoSelectViewControllerSelected(_ image: UIImage)
}
