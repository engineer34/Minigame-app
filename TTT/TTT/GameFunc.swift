//
//  GameFunc.swift
//  TTT
//
//  Created by Feliciano Medina on 2/15/25.
//

import Foundation

enum Player{
    case zero
    case exe
}

class TicTacModel: ObservableObject{
    //column count
    @Published var BOARD:[Player?] = Array(repeating: nil, count: 9)
    @Published var activeTurn:Player = .exe
    @Published var winner:Player? = nil
    //Button pressed
    func buttonTap(i: Int) {
        
        guard BOARD[i] == nil && winner == nil else{
            return
        }
        BOARD[i] = activeTurn
        if winningPlayer() {
            //find who wins
            winner = activeTurn
            let winnerName = (activeTurn == .exe) ? "Player 1" : "Player 2"
                   GameDataModel.shared.updateScore(for: winnerName) // Update Core Data immediately
            //prints our winner
            print("\(activeTurn) wins the round")
        } else {
            activeTurn = (activeTurn == .exe) ? .zero : .exe
        }
        
    }
    // button label
    func buttonLbl(i:Int) -> String {
        if let player = BOARD[i] {
            return player == .exe ? "X" : "O"
            
        }
        return""
    }
    //Function that sesets game
    func resetGame() {
        BOARD = Array(repeating: nil, count: 9)
        activeTurn = .exe
        winner = nil
    }
    //Check who wins and loses
    func winningPlayer() -> Bool {
        //chatgpt found an easier way to find the winningplayer
        let winningPatterns = [
                    [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
                    [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
                    [0, 4, 8], [2, 4, 6]  // Diagonals
                ]
                
                for pattern in winningPatterns {
                    if let first = BOARD[pattern[0]],
                       first == BOARD[pattern[1]],
                       first == BOARD[pattern[2]] {
                        return true
                    }
                }
                return false
            }
        }

        /*Rows my original code
        for i in stride(from: 0, to: 9, by: 3) {
            if BOARD[i] != nil && BOARD[i] == BOARD[i+1] && BOARD[i+1]==BOARD[i+2] {
                return true
                
            }
        }
        //Columns
        for i in 0..<3 {
            if BOARD[i] != nil && BOARD[i] == BOARD[i+3] && BOARD[i+3] == BOARD[i+6] {
                return true
            }
        }
        //our diagonals
        if BOARD[0] != nil && BOARD[0] == BOARD[4] && BOARD[4] == BOARD[8] {
            return true
        }
        
        if BOARD[2] != nil && BOARD[2] == BOARD[4] && BOARD[4] == BOARD[6] {
            return true
        }
        return false
    }
         */
    
   


