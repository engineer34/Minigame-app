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
            print("\(activeTurn) wins the round")
        } else {
            activeTurn = (activeTurn == .exe) ? .zero : .exe
        }
        
    }
    //Label of button
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
        //Rows
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
        //Diagonals
        if BOARD[0] != nil && BOARD[0] == BOARD[4] && BOARD[4] == BOARD[8] {
               return true
           }
           
           if BOARD[2] != nil && BOARD[2] == BOARD[4] && BOARD[4] == BOARD[6] {
               return true
           }
        return false
    }
}
