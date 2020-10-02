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
    
    // Добавление элементов кодом
    let robolabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ROBOT"
        label.backgroundColor = .gray
        return label
    }()
    
    let statuslabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .brown
        return label
    }()
    
    let rockButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        return button
    }()
    
    let scissorsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        return button
    }()
    
    let paperButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        return button
    }()
    
    let stackAllView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = .black
        return stack
    }()
    
    let stackViewSign: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .purple
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabel.isHidden = true
        
        // отображение элементов на экране
        addAllSubview()
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
            rockLabel.isEnabled = false
            
        case .scissors:
            rockLabel.isHidden = true
            scissorsLabel.isHidden = false
            paperLabel.isHidden = true
            scissorsLabel.isEnabled = false
            
        case .paper:
            rockLabel.isHidden = true
            scissorsLabel.isHidden = true
            paperLabel.isHidden = false
            paperLabel.isEnabled = false
        }
        resetLabel.isHidden = false
    }
    
    // Reset for start position game
    func  reset() {
        rockLabel.isHidden = false
        rockLabel.isEnabled = true
        scissorsLabel.isHidden = false
        scissorsLabel.isEnabled = true
        paperLabel.isHidden = false
        paperLabel.isEnabled = true
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
    
    //MARK: - Stack view and subview
    
    func addAllSubview () {
        addStackView()
        view.addSubview(stackAllView)
        view.addSubview(resetButton)
    }
    
    func addStackView() {
        addStackViewSign()
        stackAllView.addArrangedSubview(robolabel)
        stackAllView.addArrangedSubview(statuslabel)
        stackAllView.addArrangedSubview(stackViewSign)
    }
    
    func addStackViewSign() {
        stackViewSign.addArrangedSubview(rockButton)
        stackViewSign.addArrangedSubview(scissorsButton)
        stackViewSign.addArrangedSubview(paperButton)
    }

}


