//
//  MainTabView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 1
    @EnvironmentObject var cartViewmodel: CartViewModel
    
    @Environment(\.modelContext) private var modelContext
    
    @Namespace var animation
    
    @StateObject var homeViewmodel = HomeViewModel()
    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case 0:
                CartView(selectedTab: $selectedTab)
            case 1:
                HomeView(viewmodel: homeViewmodel)
            case 2:
                ProfileView()
            default:
                HomeView(viewmodel: HomeViewModel())
            }
            
            HStack {
                Button(action: {
                    selectedTab = 0
                }) {
                    ZStack(alignment: .top){
                        if selectedTab == 0 {
                            Capsule().foregroundColor(.white).frame(height: 3)
                                .matchedGeometryEffect(id: "bar", in: animation)
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.2),
                                    Color.clear
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                           
                        }
                        HStack {
                            Image(systemName: "cart.fill")
                            if cartViewmodel.countCart > 0 {
                                Text("Carrinho (\(cartViewmodel.countCart))")
                            } else {
                                Text("Carrinho")
                            }
                        } .frame(width: 125).padding()
                           
                        .foregroundColor(selectedTab == 0 ? .white : .gray)
                    }
                }

                Spacer()
                
                Button(action: {
                    selectedTab = 1
                }) {
                    ZStack(alignment: .top){
                        if selectedTab == 1{
                            Capsule().foregroundColor(.white).frame(height: 3)
                                .matchedGeometryEffect(id: "bar", in: animation)
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.2),
                                    Color.clear
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                        
                        HStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .padding()
                        .foregroundColor(selectedTab == 1 ? .white : .gray)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    selectedTab = 2
                }) {
                    ZStack(alignment:.top){
                        if selectedTab == 2{
                            Capsule().foregroundColor(.white).frame(height: 3)
                                .matchedGeometryEffect(id: "bar", in: animation)
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.2),
                                    Color.clear
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                        
                        HStack {
                            Image(systemName: "person.fill")
                            Text("Perfil")
                        }
                        .padding()
                        .foregroundColor(selectedTab == 2 ? .white : .gray)
                    }
                }
            }
            .background(Color("Toolbar"))
            .frame(height: 70)
        }
        .onAppear {
            cartViewmodel.fetchCart(context: modelContext)
        }
    }
}

#Preview {
    MainTabView().environmentObject(CartViewModel())
}
