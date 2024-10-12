//
//  CustomButtonView.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 03/10/24.
//

import SwiftUI
struct CustomButtonView: View {
    var action: () -> Void
    var text: String
    var width: CGFloat
    var imageName: String?
    var hasAdded: Bool? = nil
    var productQuantity: Int? = nil
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                if let imageName = imageName {
                    Image(systemName: imageName)
                }
                
                if let productQuantity = productQuantity, productQuantity > 0 {
                    Text("\(productQuantity)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                Text(text)
                    .font(Font.system(.headline).bold())
            }
            .frame(maxWidth: width)
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background((hasAdded ?? false) || (productQuantity ?? 0 > 0) ? Color.green : Color("ButtonColor"))
            .foregroundStyle(.white)
            .cornerRadius(4.0)
        })
    }
}

#Preview {
    CustomButtonView(action: {}, text: "Adicionar ao carrinho", width: 300, hasAdded: true, productQuantity: 2)
}
