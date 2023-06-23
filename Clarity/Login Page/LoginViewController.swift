//
//  LoginViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/18/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    let loginScreen = LoginView()
    
    override func loadView() {
        view = loginScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        // Do any additional setup after loading the view.
        
        loginScreen.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
    }
    
    @objc func onButtonLoginTapped() {
        signInToFirebase()
    }
    
    

}
