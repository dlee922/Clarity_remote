//
//  LoginFirebaseManager.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import Foundation
import FirebaseAuth

extension LoginViewController {
    
    func signInToFirebase() {
        if let email = loginScreen.tfEmail.text,
           let password = loginScreen.tfPassword.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
                if error == nil {
                    print("User authenticated")
                    //MARK: maybe add progress indicator here?
                    let homePageController = HomePageViewController()
                    homePageController.currentUser = Auth.auth().currentUser
                    self.navigationController?.pushViewController(homePageController, animated: true)
                }
                else {
                    print("No user found or password incorrect")
                    //MARK: should replace with an actual alert later
                }
            })
        }
    }
}
