//
//  RegisterFirebaseManager.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import UIKit

extension RegisterViewController {
    
    func uploadProfilePhotoToStorage() {
        var profilePhotoURL: URL?
        
        showActivityIndicator()
        
        if let image = pickedImage{
            if let jpegData = image.jpegData(compressionQuality: 80) {
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("image")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil {
                        imageRef.downloadURL(completion: { (url, error) in
                            if error == nil {
                                profilePhotoURL = url
                                self.registerNewAccount(photoURL: profilePhotoURL)
                            }
                        })
                    }
                })
            }
            else {
                registerNewAccount(photoURL: profilePhotoURL)
            }
        }
    }
    
    func registerNewAccount(photoURL: URL?) {
        
        if let name = registerScreen.tfName.text,
           let email = registerScreen.tfEmail.text,
           let password = registerScreen.tfPassword.text,
           let repeatPassword = registerScreen.tfReEnterPassword.text {
            if name.isEmpty, email.isEmpty, password.isEmpty, repeatPassword.isEmpty {
                showEmptyAlert()
            }
            else {
                if !isValidEmail(email) {
                    showEmailAlert()
                }
                else {
                    if repeatPassword == password {
                        Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                            if error == nil {
                                self.setNameAndPhotoOfTheUserInFirebaseAuth(name: name, email: email, photoURL: photoURL)
                            }
                           else {
                               print("Error occurred: \(String(describing: error))")
                            }
                        })
                    }
                    else {
                        showPasswordAlert()
                        hideActivityIndicator()
                    }
                }
            }
        }
    }
    
    func setNameAndPhotoOfTheUserInFirebaseAuth(name: String, email: String, photoURL: URL?) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.photoURL = photoURL
        
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil {
                //MARK: Push the home page here
                self.hideActivityIndicator()
                
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
    
    func showPasswordAlert() {
        let alert = UIAlertController(title: "Error!", message: "Passwords do not match.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
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
