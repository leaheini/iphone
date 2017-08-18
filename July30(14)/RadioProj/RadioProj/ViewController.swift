//
//  ViewController.swift
//  RadioProj
//
//  Created by hackeru on 30/07/2017.
//  Copyright © 2017 com.hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pauseButton.isEnabled = false
        
        let urlString = "http://glzwizzlv.bynetcdn.com/glz_mp3"
        if let url = URL(string: urlString){
            player = AVPlayer(url: url)
        }
        
        // to listen music even if out of the application
        try? AVAudioSession.sharedInstance().setActive(true)
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    }

    @IBAction func playAction(_ sender: UIButton) {
        sender.isEnabled = false
        pauseButton.isEnabled = true
        
        statusLabel.text = "playing 🎶"
        
        player?.play()
    }
   
    @IBAction func pauseAction(_ sender: UIButton) {
        sender.isEnabled = false
        playButton.isEnabled = true
        
        statusLabel.text = "not playing"
        
        player?.pause()
    }
    
    @IBAction func volumeSliderAction(_ sender: UISlider) {
        player?.volume = sender.value
    }

}

