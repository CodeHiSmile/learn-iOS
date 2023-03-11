//
//  Notification.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 11/03/2023.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TBSection: CaseIterable {
    case main
}

struct NotificationModel: Hashable, Codable {
    @DocumentID var id: String?
    var title: String!
    var subTitle: String!
    var message: String!
    var image: String!
    var sentAt: Timestamp!
}


//let sampleNotifications = [
//    NotificationModel(id: "0x1", title: "New Release", subTitle: "SwiftUI", message: "A new release of the SwiftUI course has been released", image: "Logo SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x2", title: "Content Update", subTitle: "React Hooks", message: "The React Hooks course has been updated", image: "React", sentAt: Date()),
//    NotificationModel(id: "0x3", title: "New Release", subTitle: "UIKit for iOS 15", message: "A new release by Sai Kambampati has been pushed", image: "SwiftUI", sentAt: Date()),
//    NotificationModel(id: "0x4", title: "Black Friday Deal", subTitle: "Design+Code", message: "Purchase your subscription for 20% off only today", image: "Design+Code", sentAt: Date()),
//]
