//
//  CustomToolbar.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI
extension View {
    func weToolbar() -> some View {
        HStack {
            Spacer()
            Text("WeMovies")
                .font(.title)
                .foregroundColor(.white)
                .bold()
            Spacer()
        }
        .frame(height: 50)
        .background(Color("Toolbar"))
    }
}

