//
//  Course.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 03/03/2023.
//

import UIKit

class Course {
    var courseTitle: String
    var courseSubTitle: String
    var courseDescription: String
    var courseIcon: UIImage
    var courseBanner: UIImage
    var courseAuthor: [String]?
    var courseGradient: [CGColor]?
    var courseBackground: UIImage?
    
    init(title: String!, subTitle: String!,
         description: String!, icon: UIImage!,
         banner: UIImage!, authors: [String]? = nil,
         colors: [CGColor]? = nil, background: UIImage? = nil) {
        self.courseTitle = title
        self.courseSubTitle = subTitle
        self.courseDescription = description
        self.courseIcon = icon
        self.courseBanner = banner
        self.courseAuthor = authors
        self.courseGradient = colors
        self.courseBackground = background
    }
}

let handbooks = [
    Course(title: "SwiftUI Handbook",
           subTitle: "80 sections - 9 hours",
           description: "Build an iOS app for iOS 15 with custom layouts, animations and more!",
           icon: UIImage(named: "Logo SwiftUI")!,
           banner: UIImage(named: "Illustration 2")!,
           authors: ["Stephanie Diep"],
           colors: [
        UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1).cgColor,
        UIColor(red: 0.251, green: 0.555, blue: 0.835, alpha: 1).cgColor
      ]),
    Course(title: "React Hooks Handbook",
           subTitle: "30 sections - 3 hours",
           description: "A comprehensive series of tutorials on React Hooks and more!",
           icon: UIImage(named: "Logo React")!,
           banner: UIImage(named: "Illustration 4")!,
           authors: ["Meng To, Stephanie Diep"],
           colors: [
        UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1).cgColor,
        UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1).cgColor,
        UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1).cgColor
      ])
]
