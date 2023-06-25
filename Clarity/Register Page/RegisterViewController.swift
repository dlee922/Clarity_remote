//
//  RegisterViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/18/23.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseFirestore

class RegisterViewController: UIViewController {

    let registerScreen = RegisterView()
    
    let storage = Storage.storage()
    
    var pickedImage:UIImage?
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Register"

        // Do any additional setup after loading the view.
        registerScreen.buttonRegister.addTarget(self, action: #selector(onButtonRegisterTapped), for: .touchUpInside)
        
        registerScreen.buttonProfilePhoto.menu = getMenuImagePicker()
    }
    
    @objc func onButtonRegisterTapped() {
//        showActivityIndicator()
        uploadProfilePhotoToStorage()
//        registerScreen.tfEmail.text = ""
//        registerScreen.tfName.text = ""
//        registerScreen.tfPassword.text = ""
//        registerScreen.tfReEnterPassword.text = ""
    }
    
    
}
