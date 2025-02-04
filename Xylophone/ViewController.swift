//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    let opaque = 1.0
    let transparent = 0.5
    let delayS = 0.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(note: String) {
        //print(note)
        
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.opacity  = Float(transparent)
        DispatchQueue.main.asyncAfter(deadline: .now() + delayS) { [self] in
            //call any function
            self.playSound(note: sender.currentTitle!)
            sender.layer.opacity  = Float(opaque)
        }

    }
}
