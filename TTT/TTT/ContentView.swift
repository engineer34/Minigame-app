//
//  ContentView.swift
//  TTT
//
//  Created by Feliciano Medina on 2/15/25.
//

import SwiftUI

struct TicTacToeView: View {
    @ObservedObject var TicTacToe = TicTacModel()
    @State private var board: [String] = Array(repeating: "", count: 9)
    @State private var currentPlayer = "X"

    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.system(size: 45, weight: .heavy))
                .padding()
            
            
            let col = Array(repeating: GridItem(.flexible()), count: 3)
            
            LazyVGrid(columns: col, spacing: 10) {
                ForEach(0..<9, id: \.self) { i in
                    Button(action: {
                        TicTacToe.buttonTap(i: i)
                        if board[i].isEmpty {
                            board[i] = currentPlayer
                            currentPlayer = (currentPlayer == "X") ? "O" : "X"
                        }
                    }, label: {
                        Text(TicTacToe.buttonLbl(i: i))
                            
                            .frame(width: 100, height: 100)
                            .background(Color.gray)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    })
                }
            }
            .padding(.bottom)

            Button(action: {
                TicTacToe.resetGame()
                board = Array(repeating: "", count: 9) // Reset board
                currentPlayer = "X"
            }, label: {
                Text("Restart Game")
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .clipShape(Capsule())
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
