//
//  ContentView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    @State private var opacity = 0.0
    var body: some View {
        if isActive {
            MainTabView()
        } else {
            VStack {
                SplashView()
            }
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.5)) {
                    self.opacity = 1.0
                }
                // espera 3 segundos
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
