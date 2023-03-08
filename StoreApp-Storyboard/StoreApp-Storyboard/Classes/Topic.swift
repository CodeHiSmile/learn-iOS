//
//  Topic.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 05/03/2023.
//

import UIKit

class Topic {
    var topicName: String
    var topicSymbol: String

    init(name: String!, icon: String!) {
        self.topicName = name
        self.topicSymbol = icon
    }
}

let topics = [
    Topic(name: "iOS Development", icon: "iphone"),
    Topic(name: "UI Design", icon: "eyedropper"),
    Topic(name: "Web Development", icon: "desktopcomputer")
]

let librarySettings = [
    Topic(name: "History", icon: "clock.fill"),
    Topic(name: "Favories", icon: "star.fill"),
    Topic(name: "Downloads", icon: "square.and.arrow.down.fill")
]
