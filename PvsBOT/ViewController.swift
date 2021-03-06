//
//  ViewController.swift
//  FunGif
//
//  Created by Indoril Nerevar on 5/21/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let roboLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Act.robot.rawValue
        label.backgroundColor = .gray
        return label
    }()
    
    let statusLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Act.statusGame.rawValue
        label.backgroundColor = .white
        return label
    }()
    
    let rockButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle(Sign.rock.emoji, for: .normal)
        button.addTarget(self, action: #selector(rockButtonPress), for: .touchUpInside)
        return button
    }()
    
    let scissorsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitle(Sign.scissors.emoji, for: .normal)
        button.addTarget(self, action: #selector(scissorsButtonPress), for: .touchUpInside)
        return button
    }()
    
    let paperButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle(Sign.paper.emoji, for: .normal)
        button.addTarget(self, action: #selector(paperButtonPress), for: .touchUpInside)
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitle(Act.reset.rawValue, for: .normal)
        button.addTarget(self, action: #selector(resetButtonPress), for: .touchUpInside)
        return button
    }()
    
    let stackAllView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = CGFloat(10)
        return stack
    }()
    
    let stackViewSign: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = CGFloat(10)
        return stack
    }()
    
    //MARK: View life
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
        
        // отображение элементов на экране
        addAllSubview()
        fontSize()
        settingConstraints()
    }
    // Выбор результата при нажатии определенной кнопки
    func play(_ sign: Sign) {
        let oponentSign = randomSign()
        roboLabel.text = oponentSign.emoji
        
        let result = sign.getResult(for: oponentSign)
        statusLabel.text = result.rawValue
        
        // Отображение выбранной кнопки и сокрытие других
        switch sign {
        case .rock:
            rockButton.isHidden = false
            scissorsButton.isHidden = true
            paperButton.isHidden = true
            rockButton.isEnabled = false
            
        case .scissors:
            rockButton.isHidden = true
            scissorsButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isEnabled = false
            
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
            paperButton.isHidden = false
            paperButton.isEnabled = false
        }
        resetButton.isHidden = false
    }
    
    // Возвращение в начальное положение
    func  reset() {
        rockButton.isHidden = false
        rockButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        resetButton.isHidden = true
        roboLabel.text = Act.robot.rawValue // Start title for roboLabel
        statusLabel.text = Act.statusGame.rawValue // Start title for statusLabel
    }
    
    //MARK: - Action buttons
    @objc func rockButtonPress(_ sender: UIButton!) {
        play(.rock)
    }
    @objc func scissorsButtonPress(_ sender: UIButton!) {
        play(.scissors)
    }
    @objc func paperButtonPress(_ sender: UIButton!) {
        play(.paper)
    }
    @objc func resetButtonPress(_ sender: UIButton!) {
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
        stackAllView.addArrangedSubview(roboLabel)
        stackAllView.addArrangedSubview(statusLabel)
        stackAllView.addArrangedSubview(stackViewSign)
    }
    func addStackViewSign() {
        stackViewSign.addArrangedSubview(rockButton)
        stackViewSign.addArrangedSubview(scissorsButton)
        stackViewSign.addArrangedSubview(paperButton)
    }
    
    //MARK: - Font size and constraints
    func fontSize() {
        roboLabel.font = UIFont(descriptor: UIFontDescriptor(), size: view.frame.height / 8)
        statusLabel.font = UIFont(descriptor: UIFontDescriptor(), size: view.frame.height / 30)
        rockButton.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(), size: view.frame.height / 8)
        scissorsButton.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(), size: view.frame.height / 8)
        paperButton.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(), size: view.frame.height / 8)
        resetButton.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(), size: view.frame.height / 30)
    }
    
    func settingConstraints() {
        stackAllView.widthAnchor.constraint(equalToConstant: roboLabel.font.pointSize * 4).isActive = true
        stackAllView.heightAnchor.constraint(equalToConstant: roboLabel.font.pointSize * 3).isActive = true
        stackAllView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        stackAllView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: stackAllView.bottomAnchor, constant: 10).isActive = true
    }
}


