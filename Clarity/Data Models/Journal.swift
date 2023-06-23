//
//  Journal.swift
//  Clarity
//
//  Created by Daniel Lee on 6/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Journal:Codable {
    @DocumentID var id: String?
    var dateTime: String
    var text: String
    
    init(dateTime: String, text: String) {
        self.dateTime = dateTime
        self.text = text
    }
}
