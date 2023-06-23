//
//  JournalViewController.swift
//  Clarity
//
//  Created by Daniel Lee on 6/22/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class JournalViewController: UIViewController {

    let journalScreen = JournalView()
    
    var journalEntries = [Journal]()
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    let myDateFormatter = DateFormatter()
    
    override func loadView() {
        view = journalScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        journalScreen.tableViewJournal.dataSource = self
        journalScreen.tableViewJournal.delegate = self
        
        journalScreen.tableViewJournal.separatorStyle = .none
        
        journalScreen.buttonSubmit.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
        
        //MARK: Get the array of elements in the database and place into local journalEntries array
        self.observeJournalChanges()
    }
    
    @objc func onButtonSubmitTapped() {
        myDateFormatter.dateFormat = "MMMM d, y 'at' h:mm a"
        
        if let text = journalScreen.tfEntry.text {
            if text.isEmpty {
                showEmptyAlert(text: "Text")
            }
            else {
                let momentInTime = Date()
                let dateTime = myDateFormatter.string(from: momentInTime)
                let journal = Journal(dateTime: dateTime, text: text)
                saveJournalToFirestore(journal: journal)
            }
        }
    }
    
    func saveJournalToFirestore(journal: Journal) {
        if let userEmail = currentUser?.email {
            let collectionJournals = database.collection("users")
                .document(userEmail).collection("journals")
            
            do {
                try collectionJournals.addDocument(from: journal, completion: {(error) in
                    if error == nil {
                        print("Journal successfully added to database")
                    }
                })
            } catch {
                print("Error adding affirmation")
            }
        }
    }
    
    func observeJournalChanges() {
        if let userEmail = currentUser?.email {
            database.collection("users")
                .document(userEmail)
                .collection("journals").addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    self.journalEntries.removeAll()
                    for document in documents {
                        do {
                            let journal = try document.data(as: Journal.self)
                            self.journalEntries.append(journal)
                            
                        }
                        catch {
                            print(error)
                        }
                    }
                    self.journalEntries.sort(by: { $0.dateTime < $1.dateTime })
                    self.journalScreen.tableViewJournal.reloadData()
                }
            })
        }
        
    }
    
    //MARK: alert for an empty text field
    func showEmptyAlert(text:String){
        let alert = UIAlertController(title: "Error!", message: "\(text) field must not be empty!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    
}
