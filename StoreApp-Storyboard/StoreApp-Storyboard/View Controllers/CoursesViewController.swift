//
//  CoursesViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 04/03/2023.
//

import UIKit
import Combine

class CoursesViewController: UIViewController {
    var course: Course?
    
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
//    @IBOutlet weak var iconImageView: CustomImageView!
    
    @IBOutlet weak var sectionsTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        sectionsTableView.layer.masksToBounds = false
//        Gây ra lỗi UI row bị fix cứng thành 44
//        sectionsTableView.rowHeight = UITableView.automaticDimension
//        sectionsTableView.estimatedRowHeight = UITableView.automaticDimension
        
        sectionsTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        //Set data for preview card
//        self.iconImageView.image = course?.courseIcon
        self.bannerImage.image = course?.courseBanner
        self.backgroundImage.image = course?.courseBackground
        self.titleLabel.text = course?.courseTitle
        self.subTitleLabel.text = course?.courseSubTitle
        self.descriptionLabel.text = course?.courseDescription
        self.authorLabel.text = "Taught by \(course?.courseAuthor?.formatted(.list(type: .and, width: .standard)) ?? "HiSmile")"
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.course?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
        
        if let selectedCourse = course {
            let selectedSection = selectedCourse.sections![indexPath.row]
            
            cell.sectionTitle.text = selectedSection.sectionTitle
            cell.sectionLogo.image = selectedSection.sectionIcon
            cell.sectionDescription.text = selectedSection.sectionDescription
            cell.courseTitle.text = selectedSection.sectionSubtitle
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
// Gây ra lỗi UI row bị fix cứng thành 44
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}
