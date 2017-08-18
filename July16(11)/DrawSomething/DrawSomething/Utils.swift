//
//  Utils.swift
//  DrawSomething
//
//  Created by hackeru on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//


// we make swift file name: Utils
import UIKit


// code from google - to switch UIView to UIImage in order to save the pic in gallery
extension UIView{
    public func getSnapshotImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let snapshotImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return snapshotImage
    }
}
