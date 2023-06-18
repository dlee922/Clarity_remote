//
//  LoginScreenView.swift
//  Clarity
//
//  Created by Daniel Lee on 6/16/23.
//

import UIKit

class LandingPageView: UIView {

    var imageLogo: UIImage!
    var labelName: UILabel!
    var buttonLogin: UIButton!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageLogo()
        setupLabelName()
        setupButtonLogin()
        setupButtonSignUp()
        
        initConstraints()
    }
    
    func setupImageLogo() {
        
    }
    
    func setupLabelName() {
        
    }
    
    func setupButtonLogin() {
        
    }
    
    func setupButtonSignUp() {
        
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
