//
//  EmptyView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI

struct EmptyViewCart: View {
    @Binding var selectedTab : Int
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center) {
                Text("Parece que não há nada por aqui : (")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    

                Image("errorcart")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 30)
                CustomButtonView(action: {
                    selectedTab = 1
                }, text: "Voltar á Home", width: 200)
                .padding(.top,30)
            }

            Spacer()
        }
        .padding()
        .padding(.top,30)
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    EmptyView()
}
