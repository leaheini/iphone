//
//  ToggleImageView.swift
//  MultiToggleProject
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ToggleImageView: UIImageView {

    var toggleImages : [UIImage] = []{
        // didSet = someone make the array, right after do the set
        didSet{
            index = 0
            refresh()
        }
    }
    var index : Int = 0
    
    //from stroryboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(gesture)
    }
    
    func tapAction(){
        // move on the array, if its the end start from 0 again
        if index == toggleImages.count - 1 {
            index = 0
        } else {
            index += 1
        }
        refresh()
    }
    
    private func refresh(){
        // make sure the arr isnt empty
        guard toggleImages.count > 0 else {
            return
        }
        self.image = toggleImages[index]
    }

}
