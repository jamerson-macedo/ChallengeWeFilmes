//
//  ProductItemView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import SwiftUI
import Kingfisher
struct ProductItemView: View {
    @EnvironmentObject var cartViewmodel : CartViewModel
    @Environment(\.modelContext) private var modelContext
    @State var hasAddedToCart : Bool = false
    let product : Product
    
    var body: some View {
        VStack{
            KFImage(URL(string: product.image))
                .placeholder({
                    ProgressView().frame(width: 200, height: 200)
                })
                .resizable()
                .scaledToFit()
                .frame(width: 200,height: 200)
            
            Text(product.title)
                .font(.headline).padding()
            
            Text(String(format: "R$ %.2f", product.price).replacingOccurrences(of: ".", with: ","))
                .font(.headline).bold()
            
            CustomButtonView(action: {
                cartViewmodel.addToCart(product: self.product, context: modelContext)
                hasAddedToCart = true
            }, text: "Adicionar ao Carrinho", width: 300,imageName: "cart",hasAdded: hasAddedToCart,productQuantity: cartViewmodel.getProductQuantity(product: product))
            
        }.frame(width: 350, height:400)
            .background(.white)
            .cornerRadius(15)
        
    }
}
#Preview {
    ProductItemView(product: Product(id: 0, title: "Homen Aranha", price: 2.99, image: "https://wefit-react-web-test.s3.amazonaws.com/shang-chi.png"))
}
