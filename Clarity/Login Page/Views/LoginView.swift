//
//  LoginView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/18/23.
//

import UIKit

class LoginView: UIView {

    var imageLogo: UIImageView!
    var tfEmail: UITextField!
    var tfPassword: UITextField!
    var buttonLogin: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupImageLogo()
        setupTFEmail()
        setupTFPassword()
        setupButtonLogin()
        
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
    
    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 50),
            imageLogo.widthAnchor.constraint(equalToConstant: 50),
            
            tfEmail.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 16),
            tfEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tfPassword.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 16),
            tfPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            buttonLogin.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 16),
            buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
