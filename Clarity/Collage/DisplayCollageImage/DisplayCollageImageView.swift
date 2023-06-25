//
//  DisplayCollageImageView.swift
//  Clarity
//
//  Created by Isha Chadalavada on 6/24/23.
//

import UIKit

class DisplayCollageImageView: UIView {

    var collageImage:UIImageView!
    var collageLocation:UILabel!
    var collageNotes:UILabel!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupCollageImage()
        setupCollageLocation()
        setupCollageNotes()
        initConstraints()
    }
    
    func setupCollageImage() {
        collageImage = UIImageView()
        collageImage.image = UIImage(systemName: "photo")
        collageImage.contentMode = .scaleToFill
        collageImage.clipsToBounds = true
        collageImage.layer.cornerRadius = 10
        collageImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collageImage)
       
    }
    
    func setupCollageLocation() {
        collageLocation = UILabel()
        collageLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collageLocation)
    }
    
    func setupCollageNotes() {
        collageNotes = UILabel()
        collageNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collageNotes)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            collageImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            collageImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            //MARK: it is better to set the height and width of an ImageView with constraints...
            collageImage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -20),
            collageImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                        

            collageLocation.topAnchor.constraint(equalTo: collageImage.bottomAnchor, constant: 2),
            collageLocation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 4),
            
            collageNotes.topAnchor.constraint(equalTo: collageLocation.bottomAnchor, constant: 2),
            collageNotes.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 4),
            
            ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
