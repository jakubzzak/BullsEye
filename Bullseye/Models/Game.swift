//
//  Game.swift
//  Bullseye
//
//  Created by Jakub Žák on 21/12/2020.
//

import Foundation

struct Game {
    var target: Int = 42
    var score: Int = 0
    var round: Int = 1
    
    func getStringTarget() -> String {
        return String(target)
    }
    
    mutating func points(sliderValue: Int) -> Int {
        self.score += sliderValue
        return score
    }
}
