//
//  LoginFirebaseManager.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import Foundation
import FirebaseAuth
import UIKit

extension LoginViewController {
    
    func signInToFirebase() {
        if let email = loginScreen.tfEmail.text,
           let password = loginScreen.tfPassword.text {
            if email.isEmpty, password.isEmpty {
                showEmptyAlert()
            }
            else {
                if !isValidEmail(email) {
                    showEmailAlert()
                }
                else {
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
    }
    
    //MARK: alert for an empty text field
    func showEmptyAlert(){
        let alert = UIAlertController(title: "Error!", message: "Text fields must not be empty!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    //MARK: check if the provided string is a valid email
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //MARK: alert for an empty text field
    func showEmailAlert(){
        let alert = UIAlertController(title: "Error!", message: "Please provide a valid email address!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}
