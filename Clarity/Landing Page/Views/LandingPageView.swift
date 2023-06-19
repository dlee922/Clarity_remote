//
//  LoginScreenView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/16/23.
//

import UIKit

class LandingPageView: UIView {

    var imageLogo: UIImageView!
    var labelName: UILabel!
    var buttonLogin: UIButton!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageLogo()
        setupLabelName()
        setupButtonLogin()
        setupButtonSignUp()
        
        initConstraints()
        
        backgroundColor = .white
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
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.text = "Clarity"
        labelName.font = .boldSystemFont(ofSize: 36)
        labelName.textAlignment = .center
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            imageLogo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageLogo.heightAnchor.constraint(equalToConstant: 50),
            imageLogo.widthAnchor.constraint(equalToConstant: 50),
            
            labelName.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 16),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonLogin.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 50),
            buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonSignUp.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 16),
            buttonSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
