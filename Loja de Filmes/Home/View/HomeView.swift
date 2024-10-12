//
//  HomeView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewmodel : HomeViewModel
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea()
            VStack(alignment: .leading) {
                weToolbar()
                Spacer()
                contentView
            }
        }
        .onAppear {
            viewmodel.fetchProducts()
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewmodel.uiState {
        case .loading:
            VStack(alignment: .center) {
                Spacer()
                ProgressView()
                    .scaleEffect(2)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
        case .emptyList:
            EmptyViewHome().padding(.vertical,20)
        case .success(let array):
            ScrollView(showsIndicators: false) {
                description
                VStack(alignment: .center) {
                    ForEach(array) { product in
                        ProductItemView(product: product)
                            .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
            .contentMargins(15)
            
        }
    }
}


#Preview {
    HomeView(viewmodel: HomeViewModel() )
}
extension HomeView {
    var description : some View{
        VStack(alignment: .leading){
            Text("Mais Vendidos")
                .bold()
                .font(.title2)
                .foregroundStyle(.white)
                .padding(.horizontal)
            
            Text("Maiores Sucessos do WeMovies")
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.horizontal)
        }.padding(.trailing,80)
        
    }
}
