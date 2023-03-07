//
//  LoginViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 07/03/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginCard: CustomUIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var primaryBtn: UIButton!
    @IBOutlet weak var accessoryBtn: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 1.0, delay: 0.5,options: .curveEaseInOut){
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
        }
    }

}
