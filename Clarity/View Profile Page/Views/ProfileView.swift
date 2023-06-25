//
//  ProfileView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import UIKit

class ProfileView: UIView {

    var imageProfilePhoto: UIImageView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelJournalingTracker: UILabel!
    var tableViewCollage: UITableView!
    var labelAffirmations: UILabel!
    var tableViewAffirmations: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupImageProfilePhoto()
        setupLabelName()
        setupLabelEmail()
        setupLabelJournalingTracker()
        setupTableViewCollage()
        setupLabelAffirmations()
        setupTableViewAffirmations()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageProfilePhoto() {
        imageProfilePhoto = UIImageView()
        imageProfilePhoto.image = UIImage(systemName: "photo")
        imageProfilePhoto.contentMode = .scaleToFill
        imageProfilePhoto.clipsToBounds = true
        imageProfilePhoto.layer.cornerRadius = 10
        imageProfilePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageProfilePhoto)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = .boldSystemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.font = .boldSystemFont(ofSize: 16)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelEmail)
    }
    
    func setupLabelJournalingTracker() {
        labelJournalingTracker = UILabel()
        labelJournalingTracker.font = .boldSystemFont(ofSize: 16)
        labelJournalingTracker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelJournalingTracker)
    }
    
    func setupTableViewCollage() {
        tableViewCollage = UITableView()
        tableViewCollage.register(CollageTableViewCell.self, forCellReuseIdentifier: Configs.tableViewCollageID)
        tableViewCollage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewCollage)
    }
    
    func setupLabelAffirmations() {
        labelAffirmations = UILabel()
        labelAffirmations.text = "Your Received Affirmations:"
        labelAffirmations.font = .boldSystemFont(ofSize: 16)
        labelAffirmations.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelAffirmations)
    }
    
    func setupTableViewAffirmations() {
        tableViewAffirmations = UITableView()
        tableViewAffirmations.register(AffirmationsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewAffirmationsID)
        tableViewAffirmations.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewAffirmations)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageProfilePhoto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageProfilePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageProfilePhoto.heightAnchor.constraint(equalToConstant: 100),
            imageProfilePhoto.widthAnchor.constraint(equalToConstant: 100),
            
            labelName.topAnchor.constraint(equalTo: imageProfilePhoto.bottomAnchor, constant: 16),
            labelName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 16),
            labelEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            labelJournalingTracker.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelJournalingTracker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),

//            tableViewCollage.topAnchor.constraint(equalTo: labelJournalingTracker.bottomAnchor, constant: 8),
//            tableViewCollage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            tableViewCollage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            labelAffirmations.topAnchor.constraint(equalTo: labelJournalingTracker.bottomAnchor, constant: 16),
            labelAffirmations.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tableViewAffirmations.topAnchor.constraint(equalTo: labelAffirmations.bottomAnchor, constant: 8),
            tableViewAffirmations.heightAnchor.constraint(equalToConstant: 240),
            tableViewAffirmations.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewAffirmations.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
    

}
