//
//  ViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/16/23.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController {

    let landingPageScreen = LandingPageView()
    
    let storage = Storage.storage()
    
    
    override func loadView() {
        view = landingPageScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        landingPageScreen.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        landingPageScreen.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
        
    }
    
    @objc func onButtonLoginTapped() {
        let loginController = LoginViewController()
        navigationController?.pushViewController(loginController, animated: true)
    }
    
    @objc func onButtonSignUpTapped() {
        let registerController = RegisterViewController()
        navigationController?.pushViewController(registerController, animated: true)
    }


}

