//
//  CartItemView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI
import Kingfisher
struct CartItemView: View {
    let cartProduct: CartProduct
    @EnvironmentObject var cartViewmodel : CartViewModel
    @Environment(\.modelContext) private var modelContext
    
    @State private var quantidade: Int
    
    init(cartProduct: CartProduct) {
        self.cartProduct = cartProduct
        _quantidade = State(initialValue: cartProduct.quantidade)
    }
    
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: cartProduct.produto.image)).resizable()
                    .placeholder({ _ in
                        ProgressView().frame(width: 80, height: 80)
                    })
                    .scaledToFit()
                    .frame(width: 80,height: 80)
                
                VStack(alignment: .leading) {
                    Text(cartProduct.produto.title)
                        .bold()
                        .foregroundStyle(.black)
                    Text("Adicionado em ").foregroundStyle(.gray) +
                    Text(Date().formatDate(cartProduct.dateAdded)).foregroundStyle(.gray).bold()
                }
                
                Spacer()
                
                Image(systemName: "trash.fill")
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        withAnimation {
                            cartViewmodel.removeFromCart(cartProduct: cartProduct, context: modelContext)
                        }
                        
                    }
            }
            .padding()
            
            HStack {
                Button(action: {
                    if quantidade > 1 {
                        quantidade -= 1
                        updateCartQuantity()
                    }
                }) {
                    Image(systemName: "minus.circle")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)
                Text("\(quantidade)")
                    .font(.title2)
                    .padding(.horizontal).overlay{
                        Rectangle().stroke(lineWidth: 0.3).frame(width: 70)
                    }
                Button(action: {
                    quantidade += 1
                    updateCartQuantity()
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack{
                    Text("SUBTOTAL")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .bold()
                    Text(String(format: "R$ %.2f", cartProduct.produto.price * Double(quantidade)).replacingOccurrences(of: ".", with: ","))
                        .font(.headline)
                        .bold()
                }.padding()
            }
            
            Divider().frame(height: 10).foregroundStyle(.black)
            
            
        }
        
        .onAppear{
            cartViewmodel.fetchCart(context: modelContext)
        }
    }
    
    private func updateCartQuantity() {
        cartProduct.quantidade = quantidade
        do {
            try modelContext.save()
        } catch {
            print("Erro ao atualizar a quantidade: \(error)")
        }
    }
}

#Preview {
    CartItemView(cartProduct: CartProduct(produto: Product(id: 0, title: "Homem de Ferro", price: 2.22, image: "https://wefit-react-web-test.s3.amazonaws.com/shang-chi.png"), quantidade: 1))
}
