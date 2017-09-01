//
//  BackgroundTableViewCell.swift
//  IconDesign
//
//  Created by Austin Money on 8/18/17.
//  Copyright © 2017 Austin Money. All rights reserved.
//

import UIKit

class BackgroundTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroundSwitch: UISwitch!
    
    @IBAction func switchValueDidChange(_ sender: UISwitch) {
        
        NotificationCenter.default.post(name: Notification.Name("otherBackgroundSwitchTurnedOn"), object: nil, userInfo: ["background": background])
        
        
        
    }
    
    var background: Background? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        backgroundImage.image = background?.backgroundImage
//        backgroundSwitch.isOn = !background?.isOn
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        NotificationCenter.default.addObserver(self, selector: #selector(turnSwitchOff(notification:)), name: Notification.Name("otherBackgroundSwitchTurnedOn"), object: nil)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func turnSwitchOff(notification: Notification) {
        
        guard let notificationBackground = notification.userInfo?["background"] as? Background else { return }
        
        guard background != notificationBackground else { return }
        
        backgroundSwitch.isOn = false
        
        
    }

}
