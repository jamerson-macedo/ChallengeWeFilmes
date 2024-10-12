//
//  CartViewModel.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import Foundation
import SwiftData
class CartViewModel: ObservableObject {
    @Published var cartState: CartUiState = .loading
    private let cartService = CartService()
    @Published var countCart = 0
    func fetchCart(context: ModelContext) {
        do {
            self.cartState = .loading
            let products = try cartService.fetchCart(context: context)
            self.countCart = products.count
            
            if products.isEmpty {
                self.cartState = .emptyList
                self.countCart = 0
            } else {
                self.cartState = .success(products)
            }
            
        } catch {
            print("Erro ao buscar itens do carrinho: \(error)")
            self.cartState = .emptyList
            self.countCart = 0
        }
    }
    
    
    func addToCart(product: Product, context: ModelContext) {
        do {
            let cartItems = try cartService.fetchCart(context: context)
            
            if let existingCartProduct = cartItems.first(where: { $0.produto.id == product.id }) {
                existingCartProduct.quantidade += 1
                
                try context.save()
                
                print("Quantidade do produto \(existingCartProduct.produto.title) atualizada para \(existingCartProduct.quantidade).")
            } else {
                let newCartProduct = CartProduct(produto: product, quantidade: 1)
                try cartService.addCart(cartProduct: newCartProduct, context: context)
                print("Produto \(newCartProduct.produto.title) adicionado com sucesso.")
            }
            
            fetchCart(context: context)
            
        } catch {
            print("Erro ao adicionar produto: \(error)")
        }
    }
    
    
    
    
    func removeFromCart(cartProduct: CartProduct, context: ModelContext) {
        do {
            try cartService.removeCart(cartProduct: cartProduct, context: context)
            print("Produto removido com sucesso.")
            fetchCart(context: context)
            
        } catch {
            print("Erro ao remover produto: \(error)")
        }
    }
    func finishPurchase(cartProducts: [CartProduct], context: ModelContext) {
          for cartProduct in cartProducts {
              self.removeFromCart(cartProduct: cartProduct, context: context)
          }
          self.cartState = .isPurchasing
      }
    func getProductQuantity(product: Product) -> Int {
        
        if case let .success(cartProducts) = cartState {
            if let cartProduct = cartProducts.first(where: { $0.produto.id == product.id }) {
                return cartProduct.quantidade
            }
        }
        return 0
    }
    func totalCartValue() -> Double {
         if case let .success(cartProducts) = cartState {
             return cartProducts.reduce(0) { $0 + ($1.produto.price * Double($1.quantidade)) }
             // soma tudo $0 valor acumulado + elemento atual * quantidade
         }
         return 0.0
     }
}
