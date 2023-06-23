//
//  JournalTableViewManager.swift
//  Clarity
//
//  Created by Daniel Lee on 6/22/23.
//

import Foundation
import UIKit

extension JournalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewJournalID, for: indexPath) as! JournalTableViewCell
    
        cell.labelDateTime.text = journalEntries[indexPath.row].dateTime
        cell.labelText.text = journalEntries[indexPath.row].text
            
        return cell
    }
}
