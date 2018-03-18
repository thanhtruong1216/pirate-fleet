//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        
        let smallShip = Ship(length: 2, location: GridLocation(x: 0, y: 0), isVertical: true)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 1, y: 5), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 2, y: 0), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 3, y: 0), isVertical: true)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 3, y: 6), isVertical: false)
        
        let mine1 = Mine(location: GridLocation(x: 5, y: 5), explosionText: "Bumm1")
        let mine2 = Mine(location: GridLocation(x: 7, y: 7), explosionText: "Bumm2")
        
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        let finalScore: Int
        let ships = 5
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        let enemyShipsSunk = ships - gameStats.enemyShipsRemaining
        let humanShipsRemaining = ships - gameStats.humanShipsSunk
        let sinkBonus = gameStats.sinkBonus
        let shipBonus = gameStats.shipBonus
        let guessPenalty = gameStats.guessPenalty
        
        // Calculates the final score
        finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        print("The value of final score is \(finalScore)")
        return finalScore
    }
}
