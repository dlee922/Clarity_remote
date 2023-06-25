//
//  JournalView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/22/23.
//

import UIKit

class JournalView: UIView {
    
    var labelQuestion: UILabel!
    var tfEntry: UITextField!
    var buttonSubmit: UIButton!
    var tableViewJournal: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLabelQuestion()
        setupTFEntry()
        setupButtonSubmit()
        setupTableViewJournal()
        
        initConstraints()
    }
    
    func setupLabelQuestion() {
        labelQuestion = UILabel()
        labelQuestion.text = "What's on your mind today?"
        labelQuestion.font = .boldSystemFont(ofSize: 16)
        labelQuestion.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelQuestion)
    }
    
    func setupTFEntry() {
        tfEntry = UITextField()
        tfEntry.placeholder = "Enter your journal entry here"
        tfEntry.borderStyle = .roundedRect
        tfEntry.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tfEntry)
    }
    
    func setupButtonSubmit() {
        buttonSubmit = UIButton(type: .system)
        buttonSubmit.setTitle("Submit Journal Entry", for: .normal)
        buttonSubmit.tintColor = .white
        buttonSubmit.setBackgroundImage(.pixel(ofColor: .systemMint), for: .normal)
        buttonSubmit.layer.cornerRadius = 20
        buttonSubmit.layer.masksToBounds = true
        buttonSubmit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSubmit)
    }
    
    func setupTableViewJournal() {
        tableViewJournal = UITableView()
        tableViewJournal.register(JournalTableViewCell.self, forCellReuseIdentifier: Configs.tableViewJournalID)
        tableViewJournal.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewJournal)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            labelQuestion.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            labelQuestion.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            tfEntry.topAnchor.constraint(equalTo: labelQuestion.bottomAnchor, constant: 16),
            tfEntry.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            tfEntry.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            tfEntry.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            buttonSubmit.topAnchor.constraint(equalTo: tfEntry.bottomAnchor, constant: 16),
            buttonSubmit.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSubmit.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            buttonSubmit.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            buttonSubmit.heightAnchor.constraint(equalToConstant: 40),
            
            tableViewJournal.topAnchor.constraint(equalTo: buttonSubmit.bottomAnchor, constant: 16),
            tableViewJournal.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            tableViewJournal.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewJournal.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
