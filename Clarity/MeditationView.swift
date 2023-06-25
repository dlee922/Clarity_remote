//
//  MeditationView.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit

class MeditationView: UIView {

    var mText1:UITextField!
    var mText2:UITextField!
    var mText3:UITextField!
    var mText4:UITextField!
    var mText5:UITextField!
    var mText6:UITextField!
    var mText7:UITextField!
    var mText8:UITextField!
    var mText9:UITextField!
    var buttonMeditation:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        
        setupMText1()
        setupMText2()
        setupMText3()
        setupMText4()
        setupMText5()
        setupMText6()
        setupMText7()
        setupMText8()
        setupMText9()
        
        initConstraints()
    }
    
    func setupMText1() {
        mText1 = UITextField()
        mText1.text = "Meditation can be another way to destress."
        mText1.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText1)
    }
    func setupMText2() {
        mText2 = UITextField()
        mText2.text = "There are numerous breathing techniques that "
        mText2.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText2)
    }
    func setupMText3() {
        mText3 = UITextField()
        mText3.text = "are recommended. For example, according to Stanford "
        mText3.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText3)
    }
    func setupMText4() {
        mText4 = UITextField()
        mText4.text = "University, one such technique is cyclic sighing."
        mText4.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText4)
    }
    func setupMText5() {
        mText5 = UITextField()
        mText5.text = " Cyclic sighing contains two steps:"
        mText5.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText5)
    }
    func setupMText6() {
        mText6 = UITextField()
        mText6.text = "1. Breathe in through your nose as deep as you can."
        mText6.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText6)
    }
    
    func setupMText7() {
        mText7 = UITextField()
        mText7.text = "2. Breathe out of your mouth. "
        mText7.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText7)
    }
    
    func setupMText8() {
        mText8 = UITextField()
        mText8.text = "This works because it changes the way you breathe "
        mText8.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText8)
    }
    
    func setupMText9() {
        mText9 = UITextField()
        mText9.text = "and increases the oxygen in your body"
        mText9.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mText9)
    }
    
    

    
    func initConstraints() {
        NSLayoutConstraint.activate([
            mText1.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            mText1.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText2.topAnchor.constraint(equalTo: mText1.bottomAnchor, constant: 2),
            mText2.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText3.topAnchor.constraint(equalTo: mText2.bottomAnchor, constant: 2),
            mText3.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText4.topAnchor.constraint(equalTo: mText3.bottomAnchor, constant: 2),
            mText4.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText5.topAnchor.constraint(equalTo: mText4.bottomAnchor, constant: 2),
            mText5.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText6.topAnchor.constraint(equalTo: mText5.bottomAnchor, constant: 2),
            mText6.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText7.topAnchor.constraint(equalTo: mText6.bottomAnchor, constant: 2),
            mText7.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText8.topAnchor.constraint(equalTo: mText7.bottomAnchor, constant: 2),
            mText8.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            mText9.topAnchor.constraint(equalTo: mText8.bottomAnchor, constant: 2),
            mText9.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
           ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
