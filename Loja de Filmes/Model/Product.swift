//
//  Filme.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import Foundation

struct ProductsResponse: Codable {
    let products: [Product]
}
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let image: String
}
