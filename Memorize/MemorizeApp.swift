//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Guillermo Reyes on 8/3/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
