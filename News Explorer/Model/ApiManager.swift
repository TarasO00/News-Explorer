//
//  ApiManager.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import Foundation

final class ApiManager {
    private enum ApiError: Error {
        case invalidUrl
    }
    
    func getData<T: Decodable>(url: String, model: T.Type, completion:@escaping(Result<T, Error>) -> ()) {
            guard let url = URL(string: url) else {
                completion(.failure(ApiError.invalidUrl))
                return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    if let error = error { completion(.failure(error)) }
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let serverData = try decoder.decode(T.self, from: data)
                    completion(.success(serverData))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
}
