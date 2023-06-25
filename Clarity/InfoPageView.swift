//
//  InfoPageView.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/19/23.
//

import UIKit

class InfoPageView: UIView {
    

    var tableViewInfoPage: UITableView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        
        setupTableViewInfoPage()
        initConstraints()
    }
    

    
    func setupTableViewInfoPage(){
        tableViewInfoPage = UITableView()
        tableViewInfoPage.register(InfoPageTableViewCell.self, forCellReuseIdentifier: "infopage")
        tableViewInfoPage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewInfoPage)
    }
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewInfoPage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewInfoPage.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewInfoPage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewInfoPage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
