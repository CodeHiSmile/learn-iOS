//
//  LibraryViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 08/03/2023.
//

import UIKit
import Combine

class LibraryViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var certificatesLabel: UILabel!
    @IBOutlet var sectionsCollectionView: UICollectionView!
    @IBOutlet var topicTableView: UITableView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Collection View
        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
        
        //Table View
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

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SectionCell",
            for: indexPath) as! SectionsCollectionViewCell
        
        let section = sections[indexPath.item]
        
        cell.titleLabel.text = section.sectionTitle
        cell.subtitleLabel.text = section.sectionSubtitle
        cell.logo.image = section.sectionIcon
        cell.banner.image = section.sectionBanner
        
        return cell
    }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return librarySettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
        
        
        let setting = librarySettings[indexPath.row]
            
        cell.topicTitle.text = setting.topicName
        cell.topicIcon.image = UIImage(systemName: setting.topicSymbol)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
