//
//  HomePageViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class HomePageViewController: UIViewController {

    let homeScreen = HomePageView()
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    var affirmations = [Affirmation]()
    
    override func loadView() {
        view = homeScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"

        // Do any additional setup after loading the view.
        homeScreen.buttonJournaling.addTarget(self, action: #selector(onButtonJournalingTapped), for: .touchUpInside)
        homeScreen.buttonSubmitAffirmation.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        homeScreen.buttonLocations.addTarget(self, action: #selector(onButtonLocationsTapped), for: .touchUpInside)
        homeScreen.buttonViewProfile.addTarget(self, action: #selector(onButtonViewProfileTapped), for: .touchUpInside)
        homeScreen.buttonViewInfo.addTarget(self, action: #selector(onButtonViewInfoTapped), for: .touchUpInside)
        
        setupRightBarButton()
    }
    
    @objc func onButtonJournalingTapped() {
        let journalScreen = JournalViewController()
        journalScreen.currentUser = currentUser
        navigationController?.pushViewController(journalScreen, animated: true)
    }
    
    @objc func onButtonSubmitTapped() {
        //MARK: Submit the text inside the text field to the database
        if let text = homeScreen.tfAffirmation.text {
            if text.isEmpty {
                showEmptyAlert(text: "Affirmation")
            }
            else {
                let affirmation = Affirmation(text: text)
                saveAffirmationToFirestore(affirmation: affirmation)
            }
        }
    }
    
    func saveAffirmationToFirestore(affirmation: Affirmation) {
        let collectionAffirmations = database.collection("affirmations")
        do {
            try collectionAffirmations.addDocument(from: affirmation, completion: {(error) in
                if error == nil {
                    print("Affirmation successfully added to database")
                    //MARK: Get the array of elements in the database and place into local affirmations array
                    self.observeAffirmationChanges()
                }
            })
        } catch {
            print("Error adding affirmation")
        }
    }
    
    //MARK: Refreshing the local affirmation array after adding a new affirmation.
    func observeAffirmationChanges() {
        database.collection("affirmations").addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            if let documents = querySnapshot?.documents {
                self.affirmations.removeAll()
                for document in documents {
                    do {
                        let affirmation = try document.data(as: Affirmation.self)
                        self.affirmations.append(affirmation)
                        
                    }
                    catch {
                        print(error)
                    }
                }
                //MARK: Display one of the strings inside of the affirmations array as the text for the label
                if let receivedAffirmation = self.affirmations.randomElement() {
                    self.homeScreen.labelAffirmation.text = receivedAffirmation.text
                    self.saveReceivedAffirmationToUser(affirmation: receivedAffirmation)
                }
            }
        })
    }
    
    func saveReceivedAffirmationToUser(affirmation: Affirmation) {
        if let userEmail = currentUser?.email {
            let collectionAffirmations = database
                .collection("users")
                .document(userEmail)
                .collection("receivedAffirmations")
            
            do {
                try collectionAffirmations.addDocument(from: affirmation, completion: {(error) in
                    if error == nil {
                        print("Received affirmation successfully added to database")
                        //MARK: Get the array of elements in the database and place into local affirmations array
                    }
                })
            } catch {
                print("Error adding affirmation")
            }
        }
    }
    
    @objc func onButtonLocationsTapped() {
        
    }
    
    @objc func onButtonViewProfileTapped() {
        let viewProfileScreen = ProfileViewController()
        viewProfileScreen.currentUser = currentUser
        navigationController?.pushViewController(viewProfileScreen, animated: true)
    }
    
    @objc func onButtonViewInfoTapped() {
        let infoScreen = InfoPageViewController()
        navigationController?.pushViewController(infoScreen, animated: true)
   
    }
    
    @objc func onButtonCollageTapped() {
        let collageScreen = CollageViewController()
        collageScreen.databaseDelegate = self
        navigationController?.pushViewController(infoScreen, animated: true)
   
    }
    
    //MARK: alert for an empty text field
    func showEmptyAlert(text:String){
        let alert = UIAlertController(title: "Error!", message: "\(text) field must not be empty!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    

}
