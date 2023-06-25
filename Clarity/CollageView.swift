//
//  CollageView.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/19/23.
//

import UIKit

class CollageView: UIView {

    var buttonAddImage:UIButton!
    var imageTableView:UITableView!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupImageTableView()
        initConstraints()
    }
    
    func setupImageTableView() {
        imageTableView = UITableView()
        imageTableView.register(CollageImageTableViewCell.self, forCellReuseIdentifier: "collageimage")
        imageTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageTableView)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageTableView.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor),
            imageTableView.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor),
            imageTableView.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            

        
            
            ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
