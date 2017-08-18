//
//  ImageUtils.swift
//  SmurfSpiteSheet
//
//  Created by hackeru on 26/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

extension UIImage{
    func crop(rect : CGRect) -> UIImage?{
        
        //make photo more focused cause the retina pixels
        var rect = rect
        rect.origin.x *= self.scale
        rect.origin.y *= self.scale
        rect.size.width *= self.scale
        rect.size.height *= self.scale
        
        // crop
        if let cgImage = self.cgImage?.cropping(to: rect){
            return UIImage(cgImage: cgImage)
        }
        return nil
    }
    
    // creating array of UIImages
    func cropSpriteSheet(rows : UInt, columns : UInt) -> [UIImage]{
        let w = self.size.width / CGFloat(columns)  // self - the origin big image / number of columns on image
        let h = self.size.height / CGFloat(rows)
        
        var cropRect = CGRect(x: 0, y: 0, width: w, height: h)
        var result : [UIImage] = []
        
        for _ in 0..<rows{
            for _ in 0..<columns{
                
                //crop subImage
                if let subImage = self.crop(rect: cropRect){   // cause func crop return optional UIImage
                    result.append(subImage)
                }
                
                //increment x to next row's sub-image
                cropRect.origin.x += w
            }
            
            //row finished, increment y to next colums
            //set x to be first sumImage in the row
            cropRect.origin.y += h
            cropRect.origin.x = 0
        }
        
        return result
    }
    
    
}
