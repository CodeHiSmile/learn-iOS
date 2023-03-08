//
//  ExploreViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 04/03/2023.
//

import UIKit
import Combine

class ExploreViewController: UIViewController {

    @IBOutlet weak var topicTableView: UITableView!
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.layer.masksToBounds = false
        
        topicTableView.delegate = self
        topicTableView.dataSource = self
        topicTableView.layer.masksToBounds = false
        
        //listen event height when scroll table which will update height of screen
        topicTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height + 16
            }
            .store(in: &tokens)
        
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionsCollectionView {
            return sections.count
        } else {
            return handbooks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "SectionCell",
                for: indexPath) as! SectionsCollectionViewCell
            
            let section = sections[indexPath.item]
            
            cell.titleLabel.text = section.sectionTitle
            cell.subtitleLabel.text = section.sectionSubtitle
            cell.logo.image = section.sectionIcon
            cell.banner.image = section.sectionBanner
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "CourseCell",
                for: indexPath) as! HandbookCollectionViewCell
            
            let handbook = handbooks[indexPath.item]
            
            cell.titleLabel.text = handbook.courseTitle
            cell.subtitleLabel.text = handbook.courseSubTitle
            cell.descriptionLabel.text = handbook.courseDescription
            cell.gradient.colors = handbook.courseGradient
            cell.logo.image = handbook.courseIcon
            cell.banner.image = handbook.courseBanner
            
            return cell
        }
        
        
    }
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
        
        
        let selectedTopic = topics[indexPath.row]
            
        cell.topicTitle.text = selectedTopic.topicName
        cell.topicIcon.image = UIImage(systemName: selectedTopic.topicSymbol)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//extension ExploreViewController: UIScrollViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        self.lastScrollYPosition = scrollView.contentOffset.y
//        let totalScrollHeight = scrollView.contentSize.height
//        let percentage = lastScrollYPosition / totalScrollHeight
//        
//        if percentage <= 0.2 {
//            self.titleLabel.text = "Recent"
//        } else if percentage <= 0.6 {
//            self.titleLabel.text = "Topics"
//        } else {
//            self.titleLabel.text = "Popular"
//        }
//    }
//}
