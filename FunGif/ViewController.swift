//
//  ViewController.swift
//  FunGif
//
//  Created by Indoril Nerevar on 5/21/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roboLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockLabel: UIButton!
    @IBOutlet weak var scissorsLabel: UIButton!
    @IBOutlet weak var paperLabel: UIButton!
    @IBOutlet weak var resetLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabel.isHidden = true
        
    }
    // Choice for opponent's sign and fix title for label text
    func play(_ sign: Sign) {
        let oponentSign = randomSign()
        roboLabel.text = oponentSign.emoji
        
        // Game result and title for status label
        let result = sign.getResult(for: oponentSign)
        statusLabel.text = result.rawValue
        
        // Choice one icon on scene view
        switch sign {
        case .rock:
            rockLabel.isHidden = false
            scissorsLabel.isHidden = true
            paperLabel.isHidden = true
            
        case .scissors:
            rockLabel.isHidden = true
            scissorsLabel.isHidden = false
            paperLabel.isHidden = true
            
        case .paper:
            rockLabel.isHidden = true
            scissorsLabel.isHidden = true
            paperLabel.isHidden = false
        }
        resetLabel.isHidden = false
    }
    
    // Reset for start position game
    func  reset() {
        rockLabel.isHidden = false
        scissorsLabel.isHidden = false
        paperLabel.isHidden = false
        resetLabel.isHidden = true
        roboLabel.text = "🤖" // Start title for roboLabel
        statusLabel.text = "Rock, Scissors or Paper?" // Start title for statusLabel
    }
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    

}


