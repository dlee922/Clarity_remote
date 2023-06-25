//
//  JournalingPageView.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit

class JournalingPageView: UIView {

    var jText1:UITextField!
    var jText2:UITextField!
    var jText3:UITextField!
    var jText4:UITextField!
    var jText5:UITextField!
    var jText6:UITextField!
    
    var buttonJournaling:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        
        setupJText1()
        setupJText2()
        setupJText3()
        setupJText4()
        setupJText5()
        setupJText6()
        
        setupButtonJournaling()
        initConstraints()
    }
    
    func setupJText1() {
        jText1 = UITextField()
        jText1.text = "Journaling is a tactic that can be used to"
        jText1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText1)
    }
    
    func setupJText2() {
        jText2 = UITextField()
        jText2.text = "get all of your feelings down on paper. It"
        jText2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText2)
    }
    func setupJText3() {
        jText3 = UITextField()
        jText3.text = "can be a tool to reduce anxiety as well by "
        jText3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText3)
    }
    func setupJText4() {
        jText4 = UITextField()
        jText4.text = "placing yourself in different scenarios or "
        jText4.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText4)
    }
    
    func setupJText5() {
        jText5 = UITextField()
        jText5.text = "merely reflecting a situation you have already"
        jText5.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jText5)
    }
    func setupJText6() {
        jText6 = UITextField()
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
            
            jText2.topAnchor.constraint(equalTo: jText1.bottomAnchor, constant: 2),
            jText2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText3.topAnchor.constraint(equalTo: jText2.bottomAnchor, constant: 2),
            jText3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText4.topAnchor.constraint(equalTo: jText3.bottomAnchor, constant: 2),
            jText4.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText5.topAnchor.constraint(equalTo: jText4.bottomAnchor, constant: 2),
            jText5.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            jText6.topAnchor.constraint(equalTo: jText5.bottomAnchor, constant: 2),
            jText6.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonJournaling.topAnchor.constraint(equalTo: jText6.bottomAnchor, constant: 2),
            buttonJournaling.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
