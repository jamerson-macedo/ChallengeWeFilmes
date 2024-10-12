//
//  CartView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//
import SwiftUI
struct CartView: View {
    @Binding var selectedTab: Int
    @EnvironmentObject var cartViewmodel: CartViewModel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppColor").ignoresSafeArea()
                VStack(alignment: .center) {
                    weToolbar()
                    Spacer()
                    contentView
                }
            }
            .onAppear {
                cartViewmodel.fetchCart(context: modelContext)
            }
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch cartViewmodel.cartState {
        case .loading:
            VStack {
                Spacer()
                ProgressView()
                    .scaleEffect(2)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .emptyList:
            VStack {
                EmptyViewCart(selectedTab: $selectedTab).padding(.vertical, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .success(let products):
            carrinhodeCompras
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    ForEach(products) { product in
                        CartItemView(cartProduct: product)
                            .padding(.bottom)
                    }
                    VStack {
                        HStack {
                            Text("TOTAL")
                                .foregroundStyle(.gray)
                                .bold()
                            Spacer()
                            Text(String(format: "%.2f", cartViewmodel.totalCartValue()).replacingOccurrences(of: ".", with: ","))
                                .font(.title)
                                .bold()
                        }
                        .padding()

                        CustomButtonView(action: {
                            cartViewmodel.finishPurchase(cartProducts: products, context: modelContext)
                        }, text: "FINALIZAR PEDIDO", width: 300).padding(.bottom)
                    }
                }
                .background(.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }

        case .isPurchasing:
            EmptyViewFinish(selectedTab: $selectedTab).padding()
        }
    }
}
extension CartView {
    var carrinhodeCompras: some View {
        Text("Carrinho de Compras")
            .bold()
            .font(.title2)
            .foregroundStyle(.white)
            .padding(.trailing, 100)
    }
}
#Preview {
    CartView(selectedTab: .constant(0)).environmentObject(CartViewModel())
}




