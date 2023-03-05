//
//  TopicsTableViewCell.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 05/03/2023.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {

    @IBOutlet weak var topicTitle: UILabel!
    @IBOutlet weak var topicIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
