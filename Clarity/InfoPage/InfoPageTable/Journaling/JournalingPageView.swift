//
//  JournalingPageView.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit

class JournalingPageView: UIView {

    var jText1:UITextView!
    var jText2:UITextView!
    var jText3:UITextView!
    var jText4:UITextView!
    var jText5:UITextView!
    var jText6:UITextView!
    var jText7:UITextView!
    var jText8:UITextView!
    
    var buttonJournaling:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        
        setupJText1()
        setupButtonJournaling()
        initConstraints()
    }
    
    func setupJText1() {
        jText1 = UITextView()
        jText1.text = "Journaling is a tactic that can be used to"
        jText1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText1)
    }
    
    func setupJText2() {
        jText2 = UITextView()
        jText2.text = "get all of your feelings down on paper. It"
        jText2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText2)
    }
    func setupJText3() {
        jText3 = UITextView()
        jText3.text = "can be a tool to reduce anxiety as well by "
        jText3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText3)
    }
    func setupJText4() {
        jText4 = UITextView()
        jText4.text = "placing yourself in different scenarios or "
        jText4.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText4)
    }
    
    func setupJText5() {
        jText5 = UITextView()
        jText5.text = "merely reflecting a situation you have already"
        jText5.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText5)
    }
    func setupJText6() {
        jText6 = UITextView()
        jText6.text = "been in. Use our journaling tool to log your feelings."
        jText6.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText6)
    }
    
    
    func setupButtonJournaling() {
        buttonJournaling = UIButton(type: .system)
        buttonJournaling.setTitle("Journaling Page", for: .normal)
        buttonJournaling.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonJournaling)
    }
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            jText1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            jText1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText2.topAnchor.constraint(equalTo: jText1.topAnchor, constant: 8),
            jText2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText3.topAnchor.constraint(equalTo: jText2.topAnchor, constant: 8),
            jText3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText4.topAnchor.constraint(equalTo: jText3.topAnchor, constant: 8),
            jText4.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText5.topAnchor.constraint(equalTo: jText4.topAnchor, constant: 8),
            jText5.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText6.topAnchor.constraint(equalTo: jText5.topAnchor, constant: 8),
            jText6.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonJournaling.topAnchor.constraint(equalTo: jText1.bottomAnchor, constant: 8),
            buttonJournaling.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
