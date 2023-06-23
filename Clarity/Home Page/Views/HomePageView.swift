//
//  HomePageView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import UIKit

class HomePageView: UIView {

    var buttonJournaling: UIButton!
    var tfAffirmation: UITextField!
    var labelAffirmation: UILabel!
    var buttonSubmitAffirmation: UIButton!
    var buttonLocations: UIButton!
    var buttonViewProfile: UIButton!
    var buttonViewInfo: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupButtonJournaling()
        setupTFAffirmation()
        setupLabelAffirmation()
        setupButtonSubmitAffirmation()
        setupButtonLocations()
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
        buttonJournaling.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonJournaling)
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
        buttonSubmitAffirmation.setTitle("", for: .normal)
        buttonSubmitAffirmation.setImage(UIImage(systemName: "arrow.right")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonSubmitAffirmation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmitAffirmation)
    }
    
    func setupButtonLocations() {
        buttonLocations = UIButton(type: .system)
        buttonLocations.setTitle("", for: .normal)
        buttonLocations.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        //buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonLocations.contentHorizontalAlignment = .fill
        buttonLocations.contentVerticalAlignment = .fill
        buttonLocations.imageView?.contentMode = .scaleAspectFit
        buttonLocations.showsMenuAsPrimaryAction = true
        buttonLocations.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLocations)
    }
    
    func setupButtonViewProfile() {
        buttonViewProfile = UIButton(type: .system)
        buttonViewProfile.setTitle("View Profile", for: .normal)
        buttonViewProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonViewProfile)
    }
    
    func setupButtonViewInfo() {
        buttonViewInfo = UIButton(type: .system)
        buttonViewInfo.setTitle("View Info", for: .normal)
        buttonViewInfo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonViewInfo)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            buttonJournaling.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            buttonJournaling.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tfAffirmation.topAnchor.constraint(equalTo: buttonJournaling.bottomAnchor, constant: 16),
            tfAffirmation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
             
            buttonSubmitAffirmation.topAnchor.constraint(equalTo: tfAffirmation.bottomAnchor, constant: 16),
            buttonSubmitAffirmation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelAffirmation.topAnchor.constraint(equalTo: buttonSubmitAffirmation.bottomAnchor, constant: 16),
            labelAffirmation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonLocations.topAnchor.constraint(equalTo: buttonSubmitAffirmation.bottomAnchor, constant: 16),
            buttonLocations.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
             
            buttonViewProfile.topAnchor.constraint(equalTo: buttonLocations.bottomAnchor, constant: 16),
            buttonViewProfile.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
             
            buttonViewInfo.topAnchor.constraint(equalTo: buttonViewProfile.bottomAnchor, constant: 16),
            buttonViewInfo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

        ])
    }
}
