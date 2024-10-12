//
//  CartProduct.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//
import SwiftData
import Foundation
@Model
class CartProduct: Identifiable {
    @Attribute(.unique) var id: UUID
    var produto: Product
    var quantidade: Int
    var dateAdded: Date 

    init(produto: Product, quantidade: Int, dateAdded: Date = Date()) {
        self.id = UUID()
        self.produto = produto
        self.quantidade = quantidade
        self.dateAdded = dateAdded
    }
}
