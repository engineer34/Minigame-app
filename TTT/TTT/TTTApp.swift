//
//  TTTApp.swift
//  TTT
//
//  Created by Feliciano Medina on 2/15/25.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Mini Game Hub")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                List {
                    NavigationLink(destination: TicTacToeView()) {
                        Text("Play Tic-Tac-Toe")
                    }
                    // Add more mini-games here
                    NavigationLink(destination: Text("Coming Soon...")) {
                        Text("Other Mini-Game")
                    }
                }
            }
        }
    }
}
@main
struct TTTApp: App {
    var body: some Scene {
        WindowGroup {
            MainMenuView()
        }
    }
}
