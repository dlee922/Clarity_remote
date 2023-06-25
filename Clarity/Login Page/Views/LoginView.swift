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
        imageLogo.image = UIImage(systemName: "apple.logo")
        imageLogo.contentMode = .scaleToFill
        imageLogo.clipsToBounds = true
        imageLogo.layer.cornerRadius = 10
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageLogo)
    }
    
    func setupTFEmail() {
        tfEmail = UITextField()
        tfEmail.placeholder = "Email"
        tfEmail.borderStyle = .roundedRect
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfEmail)
    }
    
    func setupTFPassword() {
        tfPassword = UITextField()
        tfPassword.placeholder = "Password"
        tfPassword.textContentType = .password
        tfPassword.isSecureTextEntry = true
        tfPassword.borderStyle = .roundedRect
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfPassword)
    }
    
    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.tintColor = .white
        buttonLogin.setBackgroundImage(.pixel(ofColor: .systemMint), for: .normal)
        buttonLogin.layer.cornerRadius = 20
        buttonLogin.layer.masksToBounds = true
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 65),
            imageLogo.widthAnchor.constraint(equalToConstant: 50),
            
            tfEmail.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 16),
            tfEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            tfEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            tfEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            tfPassword.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 16),
            tfPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            tfPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            tfPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            buttonLogin.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 16),
            buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonLogin.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonLogin.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            buttonLogin.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
