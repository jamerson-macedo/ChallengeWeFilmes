//
//  CartService.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import Foundation
import SwiftData
import SwiftUI
class CartService {
    
    func addCart(cartProduct: CartProduct, context: ModelContext) throws {
        context.insert(cartProduct)
        do {
            try context.save()
            print("Produto salvo: \(cartProduct)")
        } catch {
            print("Erro ao salvar produto: \(error)")
            throw error
        }
    }
    func fetchCart(context: ModelContext) throws -> [CartProduct] {
        let descriptor = FetchDescriptor<CartProduct>()
        do {
            let cartItems = try context.fetch(descriptor)
            print("Itens encontrados: \(cartItems.count)")
            return cartItems
        } catch {
            print("Erro ao buscar itens do carrinho: \(error)")
            throw error 
        }
    }
    func removeCart(cartProduct: CartProduct, context: ModelContext) throws {
        context.delete(cartProduct)
        do {
            try context.save()
            print("Produto removido")
        } catch {
            print("Erro ao remover produto: \(error)")
            throw error
        }
    }
}
