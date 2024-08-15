//
//  ApiNetwork.swift
//  Hello_World
//
//  Created by Enrique SFranco on 25/06/24.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}

final class ApiNetwork {
    
    // NOTE: Usar el protocolo Codable para parsear la información
    struct ApiContract: Codable {
        let response: String
        let results: [SuperHero]
    }
    
    struct ImageSuperhero: Codable {
        url: String
    }
    
    struct SuperHero: Codable, Identifiable {
        let id: String
        let name: String
        let image: ImageSuperhero
    }
    
    func getHeroesByQuery(query: String) async throws -> ApiContract {
        let accessToken = "61fd1809fa2ca1e7a94d0c8fb0e6f2fa"
        guard let url = URL(string: "https://superheroapi.com/api/\(accessToken)/search/\(query)") else {
            throw ApiError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let apiContract = try JSONDecoder().decode(ApiContract.self, from: data)
        
        return apiContract
    }
}
