//
//  JournalingPageViewController.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit
import FirebaseAuth

class JournalingPageViewController: UIViewController {

    var journalingScreen = JournalingPageView()
    var currentUser:FirebaseAuth.User?
    
    override func loadView() {
        view = journalingScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Journaling"
        // Do any additional setup after loading the view.
        journalingScreen.buttonJournaling.addTarget(self, action: #selector(onButtonJournalingTapped), for: .touchUpInside)
    }
    
    @objc func onButtonJournalingTapped() {
        let journalScreen = JournalViewController()
        journalScreen.currentUser = currentUser
        navigationController?.pushViewController(journalScreen, animated: true)
  
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
