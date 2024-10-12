//
//  CartUiState.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import Foundation
enum CartUiState{
    case loading
    case success([CartProduct])
    case emptyList
    case isPurchasing
}
