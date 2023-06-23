//
//  AffirmationsTableViewManager.swift
//  Clarity
//
//  Created by Daniel Lee on 6/21/23.
//

import Foundation
import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedAffirmations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewAffirmationsID, for: indexPath) as! AffirmationsTableViewCell
    
        cell.labelText.text = receivedAffirmations[indexPath.row].text
            
        return cell
    }
    
    
}
