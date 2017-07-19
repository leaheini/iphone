//
//  ViewController.swift
//  Localizationsproject
//
//  Created by hackeru on 19/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = NSLocalizedString("mainvc_title_label_text", comment: "mainvc_title_label_text")
        
        secondLabel.text = "mainvc_second_label_text".localizedString    // now done otomatically by the extension
    }

    @IBAction func playAction(_ sender: Any) {
        
        if let player = player, player.isPlaying{     // to stop sound
            player.stop()
            self.player = nil
            return
        }
        
        guard let path = Bundle.main.url(forResource: "sound", withExtension: "mp3") else {
            print("file not found")
            return
        }
        
        do{
            player = try AVAudioPlayer(contentsOf: path)
            player?.play()
        }catch{
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

