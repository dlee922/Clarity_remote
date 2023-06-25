//
//  DisplayCollageImageViewController.swift
//  Clarity
//
//  Created by Isha Chadalavada on 6/24/23.
//

import UIKit

class DisplayCollageImageViewController: UIViewController {

    var delegateCollageImage: CollageImage!
    
    var displayScreen = DisplayCollageImageView()
    
    override func loadView() {
        view = displayScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollageImageView()
        // Do any additional setup after loading the view.
    }
    
    func setupCollageImageView() {
        displayScreen.collageImage.image = delegateCollageImage.image
        displayScreen.collageLocation.text = delegateCollageImage.location
        displayScreen.collageNotes.text = delegateCollageImage.notesTextField
        
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
