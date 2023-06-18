//
//  ViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/16/23.
//

import UIKit

class ViewController: UIViewController {

    let landingPageScreen = LandingPageView()
    
    override func loadView() {
        view = landingPageScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

