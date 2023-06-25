//
//  MeditationViewController.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit

class MeditationViewController: UIViewController {

    
    var meditationScreen = MeditationView()
    
    override func loadView() {
        view = meditationScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Meditation"

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
