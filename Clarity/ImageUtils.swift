//
//  ImageUtils.swift
//  Clarity
//
//  Created by Daniel Lee on 6/24/23.
//

import Foundation
import UIKit

extension UIImage {
    //MARK: Borrowed from: https://olegdreyman.medium.com/making-a-beautiful-responsive-uibutton-in-swift-81263766b2d9
    

    public static func pixel(ofColor color: UIColor) -> UIImage {
        let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

        UIGraphicsBeginImageContext(pixel.size)
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }

        context.setFillColor(color.cgColor)
        context.fill(pixel)

        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
      }

}
