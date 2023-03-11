//
//  NotificationViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 11/03/2023.
//

import UIKit
import Combine
import FirebaseFirestore

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
        Task {
            do {
                try await loadData()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
        
        notificationTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.notiTableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
    }
    
    func loadData() async throws {
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection, NotificationModel>()
        currentSnapshot.appendSections([.main])

        let docs = try await Firestore.firestore()
            .collection("notifications")
            .order(by: "sentAt", descending: false)
            .getDocuments()
        var notifications = [NotificationModel]()

        for docSnapshot in docs.documents {
            if let data = try? docSnapshot.data(as: NotificationModel.self) {
                notifications.append(data)
            }
        }

        self.currentSnapshot.appendItems(notifications, toSection: .main)
        await self.dataSource.apply(currentSnapshot, animatingDifferences: true)
        DispatchQueue.main.async {
            self.cardView.alpha = 1
        }
    }
}

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
