//
//  ProfileView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 03/10/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color("AppColor").ignoresSafeArea()
            VStack{
                Image("jamerson")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(lineWidth: 4).foregroundStyle(.white)
                    }
                    .shadow(radius: 10)
                
                Text("Jamerson Macedo").font(.title).foregroundStyle(.white).bold()
            }.padding()
        }
    }
}

#Preview {
    ProfileView()
}
