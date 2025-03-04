
//  TTTApp.swift


import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Mini Games")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                List {
                    // My tictactoe view navigation link
                    NavigationLink(destination: TicTacToeView()) {
                        Text("Play Tic-Tac-Toe")
                    }
                    // my card game nav
                    
                    NavigationLink(destination: HighLowCardGameView()){
                        Text("Play High-Low Card")
                    }
                    
                    // Add more mini-games here
                    NavigationLink(destination: Text("Will be coming soon....")) {
                        Text("Other Mini-Games")
                    }
                }
            }
        }
    }
}
@main
struct TTTApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
            WindowGroup {
                MainMenuView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
