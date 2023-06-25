//
//  AddCollageImageViewController.swift
//  Clarity
//
//  Created by Isha Chadalavada on 6/24/23.
//

import UIKit
import PhotosUI
import FirebaseFirestore
import FirebaseStorage


class AddCollageImageViewController: UIViewController {

    var addCollageScreen = AddCollageImageView()
    var pickedImage:UIImage?
    var collageDelegate:CollageViewController! = CollageViewController()
    var userName: String = ""
    var fileURL: URL = URL(fileURLWithPath: "")
    var databaseDelegate:HomePageViewController = HomePageViewController()
    
    override func loadView() {
        view = addCollageScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCollageScreen.buttonCollageImage.menu = getMenuImagePicker()
        
        addCollageScreen.buttonAddCollageImage.addTarget(self, action: #selector(onButtonAddCollageImage), for: .touchUpInside)
        
    title = "Add a Image to the Collage"

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
    
    func getMenuImagePicker() -> UIMenu{
        let menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onButtonAddCollageImage(){
        
        var collageImage: UIImage?
        if let image = addCollageScreen.buttonCollageImage.imageView {
            collageImage = image.image

        }
        
        var location:String?
              if let locationText = addCollageScreen.textFieldLocation.text{
                  if !locationText.isEmpty{
                      location = locationText
                  }else{
                      //do your thing to alert user...
                      return
                  }
              }
        
        var notes:String?
              if let notesText = addCollageScreen.textFieldNotes.text{
                  if !notesText.isEmpty{
                      notes = notesText
                  }else{
                      //do your thing to alert user...
                      return
                  }
              }
        
       
        uploadToStorage(image: collageImage!, location: location!, notes: notes!)
      
       
            print("error")
        if (collageDelegate.collageImages.count < 3) {
            let addCollageImage = CollageImage(image: collageImage, notes: notes, location: location)
            collageDelegate.collageImages.append(addCollageImage)
            collageDelegate.CollageScreen.imageTableView.reloadData()
        }
            

       
        
        
        self.navigationController?.popViewController(animated: false)
     
      
    }
    
    func uploadToStorage(image: UIImage, location: String, notes: String){
        // Data in memory
        var data = Data()
        var downloadedURL: URL? = nil

        let storageRef = collageDelegate.storage.reference()
        
        data = image.pngData()!
        var fileName = "imageUsers/" + userName + "-" + location + "-" + notes
        // Create a reference to the file you want to upload
        let fileref = storageRef.child(fileName)

        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = fileref.putData(data, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            print(error)
            return
          }
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
            fileref.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
                print("error")
              return
            }
                do {
                    print(self.userName)
                    var fileString = try String(contentsOf: downloadURL)
                    self.databaseDelegate.database.collection("users").document(self.userName).collection("images").document(fileName).setData(["url": fileString, "location": location, "notes": notes])
//                    let addCollageImage = CollageImageDatabase(url: downloadURL, location: location, notes: notes)
                  
                }
                catch {
                    
                }
                
          }
           
        }
        
    }
    

}



extension AddCollageImageViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(
                    ofClass: UIImage.self,
                    completionHandler: { (image, error) in
                        DispatchQueue.main.async{
                            if let uwImage = image as? UIImage{
                                self.addCollageScreen.buttonCollageImage.setImage(
                                    uwImage.withRenderingMode(.alwaysOriginal),
                                    for: .normal
                                )
                                self.pickedImage = uwImage
                                
                            }
                        }
                    }
                )
            }
        }
        
    }
    
//    for (index,result) in results.enumerated() {
//                 result.itemProvider.loadFileRepresentation(forTypeIdentifier: "public.jpeg") { (url, error) in
//        guard let fileUrl = url else {return }
//            print(fileUrl)
//         }
}

//MARK: adopting required protocols for UIImagePicker...
extension AddCollageImageViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addCollageScreen.buttonCollageImage.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
        
        guard let fileUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL else { return }
        print(fileUrl.lastPathComponent)
 
    }
  
}

extension UIImageView {
    func load(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
             // Error handling...
             guard let imageData = data else { return }

             DispatchQueue.main.async {
               self.image = UIImage(data: imageData)
             }
           }.resume()
        }
    }

