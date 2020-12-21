//
//  Game.swift
//  Bullseye
//
//  Created by Jakub Žák on 21/12/2020.
//

import Foundation


struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    mutating func addScore(sliderValue: Int) -> Void {
        score += abs(sliderValue - self.target)
    }
    
    mutating func nextRound() {
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restartGame() {
        round = 0
        score = 0
        nextRound()
    }
}
