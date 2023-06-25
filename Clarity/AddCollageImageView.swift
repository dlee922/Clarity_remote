//
//  AddCollageImageView.swift
//  Clarity
//
//  Created by Isha Chadalavada on 6/24/23.
//

import UIKit

class AddCollageImageView: UIView {

    var buttonCollageImage:UIButton!
    var textFieldLocation:UITextField!
    var textFieldNotes:UITextField!
    var buttonAddCollageImage:UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        
        setupbuttonTakePhoto()
        setupTextFieldLocation()
        setupTextFieldNotes()
        setupButtonAddCollageImage()
        initConstraints()
        
        
    }
    
    func setupbuttonTakePhoto(){
        buttonCollageImage = UIButton(type: .system)
        buttonCollageImage.setTitle("", for: .normal)
        buttonCollageImage.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonCollageImage.contentHorizontalAlignment = .fill
        buttonCollageImage.contentVerticalAlignment = .fill
        buttonCollageImage.imageView?.contentMode = .scaleAspectFit
        buttonCollageImage.translatesAutoresizingMaskIntoConstraints = false
        buttonCollageImage.showsMenuAsPrimaryAction = true
        self.addSubview(buttonCollageImage)
    }
    
    func setupTextFieldLocation() {
        textFieldLocation = UITextField()
        textFieldLocation.text = "Location"
        textFieldLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldLocation)
    }
    
    func setupTextFieldNotes() {
        textFieldNotes = UITextField()
        textFieldNotes.text = "Enter any feelings about this place/memory"
        textFieldNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldNotes)
    }
    
    func setupButtonAddCollageImage() {
        buttonAddCollageImage = UIButton(type: .system)
        buttonAddCollageImage.setTitle("Add Image", for: .normal)
        buttonAddCollageImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonAddCollageImage)
  
        
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            buttonCollageImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            buttonCollageImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonCollageImage.widthAnchor.constraint(equalToConstant: 100),
            buttonCollageImage.heightAnchor.constraint(equalToConstant: 100),
            
            
            textFieldLocation.topAnchor.constraint(equalTo: buttonCollageImage.bottomAnchor, constant: 4),
            textFieldLocation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldNotes.topAnchor.constraint(equalTo: textFieldLocation.bottomAnchor, constant: 4),
            textFieldNotes.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonAddCollageImage.topAnchor.constraint(equalTo: textFieldNotes.bottomAnchor, constant: 4),
            buttonAddCollageImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
            
            ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
