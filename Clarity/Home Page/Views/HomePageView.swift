//
//  HomePageView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import UIKit

class HomePageView: UIView {

    var buttonJournaling: UIButton!
    var buttonCollage: UIButton!
    var tfAffirmation: UITextField!
    var labelAffirmation: UILabel!
    var buttonSubmitAffirmation: UIButton!
    var buttonViewProfile: UIButton!
    var buttonViewInfo: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupButtonJournaling()
        setupButtonCollage()
        setupTFAffirmation()
        setupLabelAffirmation()
        setupButtonSubmitAffirmation()
        setupButtonViewProfile()
        setupButtonViewInfo()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtonJournaling() {
        buttonJournaling = UIButton(type: .system)
        buttonJournaling.setTitle("Journaling", for: .normal)
        buttonJournaling.tintColor = .white
        buttonJournaling.setBackgroundImage(.pixel(ofColor: .systemMint), for: .normal)
        buttonJournaling.layer.cornerRadius = 20
        buttonJournaling.layer.masksToBounds = true
        buttonJournaling.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonJournaling)
    }
    
    func setupButtonCollage() {
        buttonCollage = UIButton(type: .system)
        buttonCollage.setTitle("Collage", for: .normal)
        buttonCollage.tintColor = .white
        buttonCollage.setBackgroundImage(.pixel(ofColor: .systemMint), for: .normal)
        buttonCollage.layer.cornerRadius = 20
        buttonCollage.layer.masksToBounds = true
        buttonCollage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonCollage)
    }
    
    
    func setupTFAffirmation() {
        tfAffirmation = UITextField()
        tfAffirmation.placeholder = "Submit an affirmation!"
        tfAffirmation.borderStyle = .roundedRect
        tfAffirmation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfAffirmation)
    }
    
    func setupLabelAffirmation() {
        labelAffirmation = UILabel()
        labelAffirmation.font = .boldSystemFont(ofSize: 16)
        labelAffirmation.textAlignment = .center
        labelAffirmation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAffirmation)
    }
    
    func setupButtonSubmitAffirmation() {
        buttonSubmitAffirmation = UIButton(type: .system)
        buttonSubmitAffirmation.setTitle("Submit", for: .normal)
        buttonSubmitAffirmation.tintColor = .white
        buttonSubmitAffirmation.setBackgroundImage(.pixel(ofColor: .systemMint), for: .normal)
        buttonSubmitAffirmation.layer.cornerRadius = 20
        buttonSubmitAffirmation.layer.masksToBounds = true
        buttonSubmitAffirmation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmitAffirmation)
    }
    
    func setupButtonViewProfile() {
        buttonViewProfile = UIButton(type: .system)
        buttonViewProfile.setTitle("View Profile", for: .normal)
        buttonViewProfile.tintColor = .white
        buttonViewProfile.setBackgroundImage(.pixel(ofColor: .systemMint), for: .normal)
        buttonViewProfile.layer.cornerRadius = 20
        buttonViewProfile.layer.masksToBounds = true
        buttonViewProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonViewProfile)
    }
    
    func setupButtonViewInfo() {
        buttonViewInfo = UIButton(type: .system)
        buttonViewInfo.setTitle("View Info", for: .normal)
        buttonViewInfo.tintColor = .white
        buttonViewInfo.setBackgroundImage(.pixel(ofColor: .systemMint), for: .normal)
        buttonViewInfo.layer.cornerRadius = 20
        buttonViewInfo.layer.masksToBounds = true
        buttonViewInfo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonViewInfo)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            buttonJournaling.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            buttonJournaling.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonJournaling.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonJournaling.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            buttonJournaling.heightAnchor.constraint(equalToConstant: 40),
            
            
            buttonCollage.topAnchor.constraint(equalTo: buttonJournaling.topAnchor, constant: 100),
            buttonCollage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonCollage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonCollage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            buttonCollage.heightAnchor.constraint(equalToConstant: 40),
            
            tfAffirmation.topAnchor.constraint(equalTo: buttonCollage.bottomAnchor, constant: 100),
            tfAffirmation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            tfAffirmation.heightAnchor.constraint(equalToConstant: 56),
            
            buttonSubmitAffirmation.topAnchor.constraint(equalTo: tfAffirmation.bottomAnchor, constant: 16),
            buttonSubmitAffirmation.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            buttonSubmitAffirmation.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            buttonSubmitAffirmation.heightAnchor.constraint(equalToConstant: 40),
                                                    
            labelAffirmation.topAnchor.constraint(equalTo: buttonSubmitAffirmation.bottomAnchor, constant: 16),
            labelAffirmation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
             
            buttonViewProfile.topAnchor.constraint(equalTo: labelAffirmation.bottomAnchor, constant: 32),
            buttonViewProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            buttonViewProfile.heightAnchor.constraint(equalToConstant: 40),
            buttonViewProfile.widthAnchor.constraint(equalToConstant: 150),
            buttonViewProfile.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            
            buttonViewInfo.topAnchor.constraint(equalTo: labelAffirmation.bottomAnchor, constant: 32),
            buttonViewInfo.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            buttonViewInfo.heightAnchor.constraint(equalToConstant: 40),
            buttonViewInfo.widthAnchor.constraint(equalToConstant: 150),
            buttonViewInfo.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 16)
            
        ])
    }
}
