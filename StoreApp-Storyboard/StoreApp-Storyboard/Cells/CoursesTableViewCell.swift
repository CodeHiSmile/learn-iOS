//
//  CoursesTableViewCell.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 04/03/2023.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseSubTitle: UILabel!
    
    @IBOutlet weak var courseLogo: UIImageView!
    @IBOutlet weak var courseBanner: UIImageView!
    @IBOutlet weak var courseBackground: UIImageView!
    @IBOutlet weak var courseDescription: UILabel!
    
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
