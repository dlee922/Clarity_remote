//
//  RegisterFirebaseManager.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

extension RegisterViewController {
    
    func registerNewAccount() {
        if let name = registerScreen.tfName.text,
           let email = registerScreen.tfEmail.text,
           let password = registerScreen.tfPassword.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                if error == nil {
                    self.setNameOfTheUserInFirebaseAuth(name: name)
                }
               else {
                   print("Error occurred: \(String(describing: error))")
                }
            })
        }
    }
    
    func setNameOfTheUserInFirebaseAuth(name: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil {
                //MARK: Push the home page here
                
                if let userEmail = Auth.auth().currentUser?.email {
                    let userName = Auth.auth().currentUser?.displayName
                    self.database.collection("users")
                        .addDocument(data: ["name": userName!, "email": userEmail]) {
                            (err) in
                            if let err = err {
                                print("Error adding user to database")
                            }
                            else {
                                print("Successfully added user")
                            }
                        }
                }
                let homePageController = HomePageViewController()
                self.navigationController?.pushViewController(homePageController, animated: true)
            }
            else {
                print("Error occurred: \(String(describing: error))")
            }
        })
    }
}
