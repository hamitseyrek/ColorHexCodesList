//
//  WebService.swift
//  ColorHexCodesList
//
//  Created by Hamit Seyrek on 17.02.2022.
//

import Foundation

enum DownloadError : Error {
    case badURL
    case noData
    case parseError
}

class WebService {
    
    // first solution
    //with async - await
    func downloadAsyncColor(url : URL) async throws -> [Color] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let colors = try? JSONDecoder().decode([Color]?.self, from: data)
        return colors ?? []
    }
    
    // second solution
    // with escaping
    func downloadColors(url : URL, completion : @escaping (Result<[Color]?, DownloadError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completion(.failure(.badURL))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            print(data)
            guard let colors = try? JSONDecoder().decode([Color]?.self, from: data) else {
                return completion(.failure(.parseError))
            }
            
            completion(.success(colors))
            
        }.resume()
    }
}
