//
//  ViewController.swift
//  ButtonProject
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //////////// building button progromatically with "win gold" text  ///////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //custom - developer need to design everything alone
        //let button = UIButton(frame: CGRect(x: 20, y: 100, width: 150, height: 70))
        
        //system - properties buildIn of XCode
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 100, width: 150, height: 70)
        
        //we want to make: Win - black and Gold - yellow with attributed string
        let text = "Win Gold"
        let atts : [String:Any] = [   // dictionary - [key: string, value: any]
            // lets make 3 keys
            NSFontAttributeName:UIFont.boldSystemFont(ofSize: 24),   // make the text bold
            NSUnderlineStyleAttributeName:NSUnderlineStyle.styleThick.rawValue,   // make text with underline
            NSUnderlineColorAttributeName:UIColor.purple    // colored the underline to purple
        ]
        let attString = NSMutableAttributedString(string: text, attributes: atts)
        
        //make the first word win black
        let winRange = NSRange(location: 0, length: 3)    // location - the first name, length - num of letters
        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.black, range: winRange)
        
        //make the second word gold yellow
        let goldRange = NSRange(location: 4, length: 4)
        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.yellow, range: goldRange)
        
        button.setAttributedTitle(attString, for: .normal)
        
        // add IBAction progromatically
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.view.addSubview(button)
    }

    func buttonPressed(){
        print(#function)
    }

}

