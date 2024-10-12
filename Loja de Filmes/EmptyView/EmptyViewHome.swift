//
//  EmptyView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI

struct EmptyViewHome: View {
    @ObservedObject var homeViewmodel = HomeViewModel()
    var body: some View {
        VStack {
            Spacer()

            VStack(alignment: .center) {
                Text("Parece que não há nada por aqui : (")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)

                Image("refresh")
                    .padding(.top, 30)
                
                
                CustomButtonView(action:{
                    homeViewmodel.fetchProducts()
                }, text: "Recarregar a Página", width: 200).padding(.top,40)
                
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    EmptyView()
}
