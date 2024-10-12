//
//  Loja_de_FilmesApp.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI

@main
struct LojadeFilmesApp: App {
    @StateObject var cartViewModel = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartViewModel)
                .modelContainer(for: [CartProduct.self])
        }
    }
}
