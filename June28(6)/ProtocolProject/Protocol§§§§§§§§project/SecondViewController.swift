//
//  SecondViewController.swift
//  Protocol§§§§§§§§project
//
//  Created by hackeru on 28/06/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func secondViewController(_ controller : SecondViewController, theTypedText text : String?)
}

class SecondViewController: UIViewController {

    var delegate : SecondViewControllerDelegate?
    var text : String?  // will get the info from the other text field
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = text
    }
    
    
    @IBAction func textFieldEditingChangedAction(_ sender: UITextField) {
        delegate?.secondViewController(self, theTypedText: textField.text)

    }

    @IBAction func dismissAction(_ sender: Any) {
        delegate?.secondViewController(self, theTypedText: textField.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
  

}
