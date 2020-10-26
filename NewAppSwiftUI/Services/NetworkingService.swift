//
//  NetworkingService.swift
//  NewAppSwiftUI
//
//  Created by Umer Khan on 01/10/2020.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
    case badResponse
}

class NetworkingService {
    
    func getNews(completion: @escaping ((Result<[Hits], NetworkError>) -> Void)) {
        
        guard let url = Constants.shared.url else {
            return completion(.failure(.badUrl))
            
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return completion(.failure(.badResponse)) }
            
            do {
                
                let result = try JSONDecoder().decode(Results.self, from: data)
                
                guard let hits = result.hits else { return completion(.failure(.decodingError))}
                completion(.success(hits))
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
