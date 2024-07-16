//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

@available(iOS 16.0, *)
class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        let currentTitle = sender.currentTitle!
        
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 0.5
        }
        
        playSound(currentTitle: currentTitle, typeOfSound: "wav")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.animate(withDuration: 0.1) {
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(currentTitle: String, typeOfSound: String) -> Void {
        guard let path = Bundle.main.path(forResource: currentTitle, ofType: typeOfSound) else {
            return
        }
        let url = URL(filePath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
}

