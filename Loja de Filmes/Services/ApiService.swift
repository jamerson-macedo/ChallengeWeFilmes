//
//  ApiService.swift
//  Loja de Filmes
//
//  Created by Jamerson Macedo on 02/10/24.
//

import Foundation

class ApiService {
    private let urlString = "https://wefit-movies.vercel.app/api/movies"
    
    private var cache: (data: [Product], timestamp: Date)? = nil
    private let cacheExpirationInterval: TimeInterval = 60 * 5 // 5 minutos
    
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        if let cachedData = cache, Date().timeIntervalSince(cachedData.timestamp) < cacheExpirationInterval {
            print("Dados sendo retornados do cache")
            completion(.success(cachedData.data))
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Error na URL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Error na data", code: 0)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(ProductsResponse.self, from: data)
                self.cache = (data: decodedData.products, timestamp: Date())
                completion(.success(decodedData.products))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
