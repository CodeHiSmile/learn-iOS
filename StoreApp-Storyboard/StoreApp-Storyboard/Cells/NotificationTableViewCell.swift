//
//  NotificationTableViewCell.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 11/03/2023.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var notificationSubTitle: UILabel!
    
    @IBOutlet weak var notificationLogo: UIImageView!
    @IBOutlet weak var notificationDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        layer.masksToBounds = false
        layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
