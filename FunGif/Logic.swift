//
//  Logic.swift
//  FunGif
//
//  Created by Indoril Nerevar on 5/24/20.
//  Copyright © 2020 Artem. All rights reserved.
//

import Foundation



// Choice sign to opponent
    func randomSign() -> Sign {
        
        // Create a random number for opponent
        let randomNumber = Int.random(in: 0...2)
        
        if randomNumber == 0 {
            return .rock
        }else if randomNumber == 1 {
            return .scissors
        }else {
            return .paper
        }
    }

enum Sign {
    case rock, scissors, paper
    
    // Variable for switching robo icon on Sign
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        case .paper:
            return "🖐"
        }
    }
    
    // Logic for define result
    func getResult(for opponent: Sign) -> Act {
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return .draw
            case .scissors:
                return .win
            case .paper:
                return .lose
            }

        case .scissors:
            switch opponent {
            case .rock:
                return .lose
            case .scissors:
                return .draw
            case .paper:
                return .win
            }
            
        case .paper:
            switch opponent {
            case .rock:
                return .win
            case .scissors:
                return .lose
            case .paper:
                return .draw
            }
        }
    }
}
