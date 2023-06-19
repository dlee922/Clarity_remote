//
//  RegisterView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/18/23.
//

import UIKit

class RegisterView: UIView {

    var imageLogo: UIImageView!
    var tfName: UITextField!
    var tfEmail: UITextField!
    var tfPassword: UITextField!
    var tfReEnterPassword: UITextField!
    var buttonProfilePhoto: UIButton!
    var buttonRegister: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupImageLogo()
        setupTFName()
        setupTFEmail()
        setupTFPassword()
        setupTFReEnterPassword()
        setupButtonProfilePhoto()
        setupButtonRegister()
        
        initConstraints()
    }
    
    func setupImageLogo() {
        imageLogo = UIImageView()
        imageLogo.image = UIImage(systemName: "photo")
        imageLogo.contentMode = .scaleToFill
        imageLogo.clipsToBounds = true
        imageLogo.layer.cornerRadius = 10
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageLogo)
    }
    
    func setupTFName() {
        tfName = UITextField()
        tfName.placeholder = "Name"
        tfName.borderStyle = .roundedRect
        tfName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfName)
    }
    
    func setupTFEmail() {
        tfEmail = UITextField()
        tfEmail.placeholder = "Username"
        tfEmail.borderStyle = .roundedRect
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfEmail)
    }
    
    func setupTFPassword() {
        tfPassword = UITextField()
        tfPassword.placeholder = "Password"
        tfPassword.borderStyle = .roundedRect
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfPassword)
    }
    
    func setupTFReEnterPassword() {
        tfReEnterPassword = UITextField()
        tfReEnterPassword.placeholder = "Re-enter password"
        tfReEnterPassword.borderStyle = .roundedRect
        tfReEnterPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfReEnterPassword)
    }
    
    func setupButtonProfilePhoto() {
        buttonProfilePhoto = UIButton(type: .system)
        buttonProfilePhoto.setTitle("", for: .normal)
        buttonProfilePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonProfilePhoto.contentHorizontalAlignment = .fill
        buttonProfilePhoto.contentVerticalAlignment = .fill
        buttonProfilePhoto.imageView?.contentMode = .scaleAspectFit
        buttonProfilePhoto.showsMenuAsPrimaryAction = true
        buttonProfilePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonProfilePhoto)
    }
    
    func setupButtonRegister() {
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Register", for: .normal)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 50),
            imageLogo.widthAnchor.constraint(equalToConstant: 50),
            
            tfName.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 16),
            tfName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tfEmail.topAnchor.constraint(equalTo: tfName.bottomAnchor, constant: 16),
            tfEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tfPassword.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 16),
            tfPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tfReEnterPassword.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 16),
            tfReEnterPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonProfilePhoto.topAnchor.constraint(equalTo: tfReEnterPassword.bottomAnchor, constant: 16),
            buttonProfilePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonRegister.topAnchor.constraint(equalTo: buttonProfilePhoto.bottomAnchor, constant: 16),
            buttonRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
