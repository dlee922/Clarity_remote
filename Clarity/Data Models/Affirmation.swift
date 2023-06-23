//
//  Affirmation.swift
//  Clarity
//
//  Created by Daniel Lee on 6/21/23.
//

import Foundation
import FirebaseFirestoreSwift
struct Affirmation: Codable {
    @DocumentID var id: String?
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
