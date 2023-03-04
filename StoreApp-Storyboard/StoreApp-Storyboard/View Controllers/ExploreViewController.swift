//
//  ExploreViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 04/03/2023.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource{
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
