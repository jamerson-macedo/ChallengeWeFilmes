//
//  ProductViewModel.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//


import Foundation

class HomeViewModel: ObservableObject {
    @Published var errorMessage: String? = nil
    @Published var uiState: HomeUiState = .loading
    private let productService = ApiService()
    
    func fetchProducts() {
        self.uiState = .loading
        productService.getProducts{ result in
            switch result {
            case .success(let products):
                if products.isEmpty{
                    
                    self.uiState = .emptyList
                    
                }else {
                    DispatchQueue.main.async{
                        self.uiState = .success(products)
                    }
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
