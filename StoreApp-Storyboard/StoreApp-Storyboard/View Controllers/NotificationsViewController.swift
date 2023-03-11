//
//  NotificationViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 11/03/2023.
//

import UIKit
import Combine

class NotificationsViewController: UIViewController {
    @IBOutlet weak var notiTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cardView: CustomUIView!
    @IBOutlet weak var notificationTableView: UITableView!
    
    var dataSource: UITableViewDiffableDataSource<TBSection, NotificationModel>! = nil
    var currentSnapshot: NSDiffableDataSourceSnapshot<TBSection, NotificationModel>! = nil
    
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationTableView.delegate = self
        
        // Configure Data Source
        self.dataSource = UITableViewDiffableDataSource<TBSection, NotificationModel>(tableView: notificationTableView) {
            (tableView: UITableView, indexPath: IndexPath, item: NotificationModel) -> NotificationTableViewCell in
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell else {
                fatalError("Can't create new cell")
            }
            
            cell.notificationTitle.text = item.title
            cell.notificationSubTitle.text = item.subTitle
            cell.notificationDescription.text = item.message
            cell.notificationLogo.image = UIImage(named: item.image)
            
            return cell
        }
        
        self.dataSource.defaultRowAnimation = .fade
        loadData()
        
        notificationTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.notiTableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
    }
    
    func loadData() {
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection, NotificationModel>()
        currentSnapshot.appendSections([.main])
        self.currentSnapshot.appendItems(sampleNotifications, toSection: .main)
        self.dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
}

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
