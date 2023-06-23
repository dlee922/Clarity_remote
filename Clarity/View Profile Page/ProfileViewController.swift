//
//  ProfileViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/19/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ProfileViewController: UIViewController {

    let profileScreen = ProfileView()
    
    var currentUser:FirebaseAuth.User?
    
    var journalingCount:Int? = 0
    
    var receivedAffirmations = [Affirmation]()
    
    let database = Firestore.firestore()
    
    override func loadView() {
       view = profileScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        // Do any additional setup after loading the view.
        if let name = currentUser?.displayName,
           let email = currentUser?.email {
            profileScreen.labelName.text = "Name: \(name)"
            profileScreen.labelEmail.text = "Email: \(email)"
        }
        
        if let count = journalingCount {
            profileScreen.labelJournalingTracker.text = "Journaling Streak: \(count)"
        }
        
        profileScreen.tableViewAffirmations.dataSource = self
        profileScreen.tableViewAffirmations.delegate = self
        profileScreen.tableViewAffirmations.separatorStyle = .none
        
        observeReceivedAffirmations()
        
        profileScreen.tableViewCollage.dataSource = self
        profileScreen.tableViewCollage.delegate = self
        profileScreen.tableViewCollage.separatorStyle = .none
        
        
    }

    func observeReceivedAffirmations() {
        if let userEmail = currentUser?.email {
            database.collection("users")
                .document(userEmail)
                .collection("receivedAffirmations")
                .addSnapshotListener(includeMetadataChanges: false, listener:{querySnapshot, error in
                    if let documents = querySnapshot?.documents {
                        self.receivedAffirmations.removeAll()
                        for document in documents {
                            do {
                                let receivedAffirmation = try document.data(as: Affirmation.self)
                                self.receivedAffirmations.append(receivedAffirmation)
                            }
                            catch {
                                print(error)
                            }
                        }
                        self.profileScreen.tableViewAffirmations.reloadData()
                    }
                })
        }
    }
    
    func incrementJournalingCount() {
        
    }
    
    
}
