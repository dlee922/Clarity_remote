//
//  CollageImage.swift
//  Clarity
//
//  Created by Isha Chadalavada on 6/24/23.
//

import Foundation
import UIKit

struct CollageImage {
    
    var image: UIImage?
    var notesTextField: String?
    var location:String?
    
    init(title: String? = nil, image: UIImage? = nil, notes: String? = nil, location: String? = nil) {
        self.image = image
        self.notesTextField = notes
        self.location = location
    }
}

struct CollageImageDatabase: Codable {
    var url: String?
    var location: String?
    var notes: String?
    
    init(url: String? = nil, location: String? = nil, notes: String? = nil) {
        self.url = url
        self.location = location
        self.notes = notes
    }
}
