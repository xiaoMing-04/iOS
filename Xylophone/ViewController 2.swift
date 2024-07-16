//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        // animation
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 0.5
        }
        
        let name: String = sender.currentTitle!
        playSound(name: name, type: "wav")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
    }
    
    
    func playSound(name: String, type: String) {
        // loading wav
        guard let path = Bundle.main.path(forResource: name, ofType: type) else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
}

