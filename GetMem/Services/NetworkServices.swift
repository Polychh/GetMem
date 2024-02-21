//
//  NetworkServices.swift
//  GetMem
//
//  Created by Polina on 18.02.2024.
//

import Foundation

final class NetworkService{
    func request() async throws -> [Meme] {
        guard let url = URL(string: "https://api.imgflip.com/get_memes")
        else{ throw GMErrors.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw
            GMErrors.invalidResponse}
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let memsArray = try decoder.decode(Mems.self, from: data)
            return memsArray.data.memes
        }catch{
            throw GMErrors.invalidData
        }
    }
}
