//
//  PerpleView.swift
//  ChessViewProject
//
//  Created by hackeru on 02/07/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

class PerpleView: UIView {

    //manual by programmer
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    //automatic - by storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        self.backgroundColor = .purple
    }

}
