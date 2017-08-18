//
//  ViewController.swift
//  LabelProject
//
//  Created by hackeru on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add label progromatically and not with storyboard
        let label = UILabel(frame: CGRect(x: 30, y: 100, width: 200, height: 60))
        label.text = "hello 😁 world hello 😁 world hello 😁 world hello 😁 world hello 😁 world hello 😁 world hello 😁 world hello 😁 world\nhello 😁 world\nhello 😁 world"    // \n --> line down
        label.numberOfLines = 0      // 0 --> flow down no minimum
        //label.sizeToFit()      // ne needed if we add constraints
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false    // When add our own constraints must be false 
        self.view.addSubview(label)
        
        //add constraints progromatically
        let top = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 8)
        
        let leading = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 16)
        
        let trailing = NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .greaterThanOrEqual, toItem: label, attribute: .trailing, multiplier: 1, constant: 16)
        
        self.view.addConstraints([top, leading, trailing])
    }

}

