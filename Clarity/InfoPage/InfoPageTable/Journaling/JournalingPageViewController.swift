//
//  JournalingPageViewController.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit

class JournalingPageViewController: UIViewController {

    var journalingScreen = JournalingPageView()
    
    override func loadView() {
        view = journalingScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Journaling"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
