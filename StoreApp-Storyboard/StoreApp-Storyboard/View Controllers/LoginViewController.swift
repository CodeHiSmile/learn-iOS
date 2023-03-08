//
//  LoginViewController.swift
//  StoreApp-Storyboard
//
//  Created by Newwave on 07/03/2023.
//

import UIKit
import FirebaseAuth
import Combine

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginCard: CustomUIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var primaryBtn: UIButton!
    @IBOutlet weak var accessoryBtn: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var emailIsEmpty = true
    var passwordIsEmpty = true
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 1.0, delay: 0.5,options: .curveEaseInOut){
            self.loginCard.alpha = 1
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
        }
        
        emailTextfield.publisher(for: \.text)
            .sink { newValue in
                self.emailIsEmpty = (newValue == "" || newValue == nil)
            }
            .store(in: &tokens)
        
        passwordTextfield.publisher(for: \.text)
            .sink { newValue in
                self.passwordIsEmpty = (newValue == "" || newValue == nil)
            }
            .store(in: &tokens)
    }
    
    @IBAction func primaryButtonAction(_ sender: Any) {
        if(emailIsEmpty || passwordIsEmpty){
            let alert = UIAlertController(title: "Missing Informaiton", message: "Please make sure to enter a valid email address and a password", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default,handler: nil))
            self.present(alert,animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: emailTextfield.text!,
                                   password: passwordTextfield.text!){
                authResult, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                // Segure over to the home screen
                self.gotoHomeScreen()
            }
            
        }
    }
    
     
    @IBAction func accessoryButtonAction(_ sender: Any) {
        
    }
    
    func gotoHomeScreen(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
        
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true,completion: nil)
    }
}
