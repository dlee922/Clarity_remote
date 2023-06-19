//
//  HomePageViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import UIKit

class HomePageViewController: UIViewController {

    let homeScreen = HomePageView()
    
    override func loadView() {
        view = homeScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
