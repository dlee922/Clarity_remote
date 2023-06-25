//
//  WordsOfAffirmationView.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit

class WordsOfAffirmationView: UIView {

    var wOAT1:UITextField!
    var wOAT2:UITextField!
    var wOAT3:UITextField!
    var wOAT4:UITextField!
    var wOAT5:UITextField!
    var wOAT6:UITextField!
    var wOAT7:UITextField!
    var wOAT8:UITextField!
    var emptyLabel:UITextField!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        
        setupWOAT1()
        setupWOAT2()
        setupWOAT3()
        setupEmptyLabel()
        setupWOAT4()
        setupWOAT5()
        setupWOAT6()
        setupWOAT7()
        setupWOAT8()
        initConstraints()
    }
    
    func setupWOAT1() {
        wOAT1 = UITextField()
        wOAT1.text = "Words of affirmation are often used to inspire"
        wOAT1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT1)
    }

    func setupWOAT2() {
        wOAT2 = UITextField()
        wOAT2.text = "confidence or motivate people into feeling more"
        wOAT2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT2)
    }

    func setupWOAT3() {
        wOAT3 = UITextField()
        wOAT3.text = "energized."
        wOAT3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT3)
    }
    
    func setupEmptyLabel() {
        emptyLabel = UITextField()
        emptyLabel.text = ""
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emptyLabel)
    }

    func setupWOAT4() {
        wOAT4 = UITextField()
        wOAT4.text = " Use our words of affirmation generator as a"
        wOAT4.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT4)
    }

    func setupWOAT5() {
        wOAT5 = UITextField()
        wOAT5.text = "place to both submit words of affirmation if "
        wOAT5.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT5)
    }
    
    func setupWOAT6() {
        wOAT6 = UITextField()
        wOAT6.text = "you have some in mind; or if you are having "
        wOAT6.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT6)
    }
    
    func setupWOAT7() {
        wOAT7 = UITextField()
        wOAT7.text = "trouble coming up with these, use the words "
        wOAT7.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT7)
    }

    func setupWOAT8() {
        wOAT8 = UITextField()
        wOAT8.text = "of affirmation generator to get some ideas."
        wOAT8.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wOAT8)
    }

  
    func initConstraints() {
        NSLayoutConstraint.activate([
            wOAT1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            wOAT1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            wOAT2.topAnchor.constraint(equalTo: wOAT1.bottomAnchor, constant: 2),
            wOAT2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            wOAT3.topAnchor.constraint(equalTo: wOAT2.bottomAnchor, constant: 2),
            wOAT3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            emptyLabel.topAnchor.constraint(equalTo: wOAT3.bottomAnchor, constant: 2),
            emptyLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            wOAT4.topAnchor.constraint(equalTo: emptyLabel.bottomAnchor, constant: 8),
            wOAT4.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            wOAT5.topAnchor.constraint(equalTo: wOAT4.bottomAnchor, constant: 2),
            wOAT5.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            wOAT6.topAnchor.constraint(equalTo: wOAT5.bottomAnchor, constant: 2),
            wOAT6.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            wOAT7.topAnchor.constraint(equalTo: wOAT6.bottomAnchor, constant: 2),
            wOAT7.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            wOAT8.topAnchor.constraint(equalTo: wOAT7.bottomAnchor, constant: 2),
            wOAT8.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
          
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
