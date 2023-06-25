//
//  CollageViewController.swift
//  FinalProject
//
//  Created by Isha Chadalavada on 6/19/23.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseStorage

class CollageViewController: UIViewController {

    
    let CollageScreen = CollageView()
    
    var collageImages = [CollageImage]()
    
    var userName: String = ""
    
    let storage = Storage.storage()
    
    var databaseDelegate: HomePageViewController = HomePageViewController()
    

    
    
    override func loadView() {
           view = CollageScreen
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        CollageScreen.imageTableView.delegate = self
        CollageScreen.imageTableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                  barButtonSystemItem: .add, target: self,
                  action: #selector(onAddBarButtonTapped)
              )
        
        generateThreeImages()
       }
    
    @objc func onAddBarButtonTapped(){
         let addCollageImageScreen = AddCollageImageViewController()
         addCollageImageScreen.collageDelegate = self
        addCollageImageScreen.databaseDelegate = self.databaseDelegate
        addCollageImageScreen.userName = self.userName
         navigationController?.pushViewController(addCollageImageScreen, animated: true)
    }
    
    func generateThreeImages() {
       var tempImages = [CollageImageDatabase]()
        self.collageImages.removeAll()
        self.databaseDelegate.database.collection("users")
                            .document(userName)
                            .collection("images")
                            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                                if let documents = querySnapshot?.documents{
                                    for document in documents{
                                        do{
                                            let docname = document.documentID
                                            let tempImage  = try document.data(as: CollageImageDatabase.self)
                                            let tempCollageImage = CollageImageDatabase(url: tempImage.url, location: tempImage.location, notes: tempImage.notes)
                                            
                                            tempImages.append(tempCollageImage)
                                        }catch{
                                            print(error)
                                        }
                                    }
                              
                                }
                            })
        
        if (tempImages.count < 3) {
            for elt in tempImages {
                var image:UIImageView = UIImageView()
                var fileString = URL(string:elt.url!)
                print(fileString)
                image.load(url:fileString!)
                let tempCollageImage = CollageImage(image:image.image, notes: elt.notes, location:elt.location)
                collageImages.append(tempCollageImage)
            }
        }
        else {
            //randomlypick out images
            
        }
        self.CollageScreen.imageTableView.reloadData()
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

extension CollageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collageImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collageimage", for: indexPath) as! CollageTableViewCell
        cell.labelText.text = collageImages[indexPath.row].location
        cell.imageCell.image = collageImages[indexPath.row].image!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayCollageImage = DisplayCollageImageViewController()
        displayCollageImage.delegateCollageImage = collageImages[indexPath.row]
        navigationController?.pushViewController(displayCollageImage, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;//Choose your custom row height
    }
}
    
