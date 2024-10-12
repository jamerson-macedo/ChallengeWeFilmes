//
//  EmptyView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI

struct EmptyViewFinish: View {
    @Binding var selectedTab : Int
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .center) {
                let currentDate = Date()
                let formattedDateTime = Date().formatDateAndTime(currentDate)
                
                Text("Compra Realizada em \(formattedDateTime.date) às \(formattedDateTime.time)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    
                Text("Compra Realizada com Sucesso!")
                    .font(.title)
                    .foregroundStyle(.black)
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                Image("finish")
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
        .padding(.all,30)
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmptyView()
}
