//
//  CoursesViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 04/03/2023.
//

import UIKit

class CoursesViewController: UIViewController {
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This course is \(course?.courseTitle)")
    }
}
