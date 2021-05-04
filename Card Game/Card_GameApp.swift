//
//  Card_GameApp.swift
//  Card Game
//
//  Created by Moazam Mir on 2/16/21.
//

import SwiftUI

@main
struct Card_GameApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            CardGameView(viewModel: game)
        }
    }
}
