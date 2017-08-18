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
    
    let pickerArray : [RadioStation]
    var currentStation : RadioStation?{
        didSet{
            if let url = currentStation?.url{
                player = AVPlayer(url: url)
                playButton.isEnabled = false
                pauseButton.isEnabled = true
                
                statusLabel.text = "playing 🎶"
                
                player?.play()
            }
        }
    }
    
    var player : AVPlayer?
    
    required init?(coder aDecoder: NSCoder) {
        pickerArray = RadioStation.readFile()  // cause its method of class RadioStation
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pauseButton.isEnabled = false
        
        /*  // if only one station
        let urlString = "http://glzwizzlv.bynetcdn.com/glz_mp3"
        if let url = URL(string: urlString){
            player = AVPlayer(url: url)
        }
         */
        
        self.currentStation = pickerArray.first
        
        // to let volume work from the iphone
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

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentStation = pickerArray[row]
    }
    
}

