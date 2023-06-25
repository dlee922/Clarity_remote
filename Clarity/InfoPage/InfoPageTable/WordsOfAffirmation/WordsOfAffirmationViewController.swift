//
//  WordsOfAffirmationViewController.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/22/23.
//

import UIKit

class WordsOfAffirmationViewController: UIViewController {

    
    var wordsOfAffirmationScreen = WordsOfAffirmationView()
    
    override func loadView() {
        view = wordsOfAffirmationScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Words of Affirmation"
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
