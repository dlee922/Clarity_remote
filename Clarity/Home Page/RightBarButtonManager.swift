//
//  RightBarButtonManager.swift
//  Clarity
//
//  Created by Daniel Lee on 6/24/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension HomePageViewController {
    func setupRightBarButton() {
        let barIcon = UIBarButtonItem(
                        image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
                        style: .plain,
                        target: self,
                        action: #selector(onLogOutBarButtonTapped)
                    )
                    let barText = UIBarButtonItem(
                        title: "Logout",
                        style: .plain,
                        target: self,
                        action: #selector(onLogOutBarButtonTapped)
                    )
        
        navigationItem.rightBarButtonItems = [barIcon, barText]
        
    }
    
    @objc func onLogOutBarButtonTapped() {
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?",
               preferredStyle: .actionSheet)
           logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                   do{
                       try Auth.auth().signOut()
                       self.navigationController?.popViewController(animated: true)
                       self.navigationController?.popViewController(animated: true)
                   }catch{
                       print("Error occured!")
                   }
               })
           )
           logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
           
           self.present(logoutAlert, animated: true)
    }
}
