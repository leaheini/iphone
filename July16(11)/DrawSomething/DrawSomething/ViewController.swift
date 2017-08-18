//
//  ViewController.swift
//  DrawSomething
//
//  Created by hackeru on 16/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var colorBarButtonItem: UIBarButtonItem!
    
    //  to make undo when someone shake the iphone
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else {
            return
        }
        drawView.undo()
    }

    @IBAction func clearAction(_ sender: Any) {
        drawView.clear()
    }
   
    @IBAction func strokeWidthAction(_ sender: UISlider) {
        drawView.strokeWidth = CGFloat(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ColorPickerViewController{
            nextVC.startColor = drawView.strokColor   //colorBarButtonItem.tintColor
            nextVC.delegate = self
        }
    }
    
    
    @IBAction func shareAction(_ sender: Any) {
        let image = self.drawView.getSnapshotImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)   
    }
    
    
    @IBAction func undoAction(_ sender: Any) {
        drawView.undo()
    }
    
    
    @IBAction func redoAction(_ sender: Any) {
        drawView.redo()
    }
    
}

// implementation to the protocol + its method
extension ViewController : ColorPickerViewControllerDelegate{
    func controller(_ controller : ColorPickerViewController, didSelectColor color : UIColor?){
        // getting info from the protocol
        drawView.strokColor = color
        colorBarButtonItem.tintColor = color
    }
}

