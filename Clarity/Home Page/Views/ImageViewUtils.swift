//
//  ImageViewUtils.swift
//  Clarity
//
//  Created by Daniel Lee on 6/24/23.
//

import Foundation
import UIKit

extension UIImageView {
    
    //MARK: loading image from Firestore storage
    func loadRemoteImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
