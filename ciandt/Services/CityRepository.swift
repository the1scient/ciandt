//
//  CityRepository.swift
//  ciandt
//
//  Created by GUILHERME FAGGION FABBRI on 25/09/25.
//

import Foundation

protocol CityRepositoryProtocol {
    func fetchCities() async throws -> [City]
}

class CityRepository {
    func fetchCities(completion: @escaping (Result<[City], Error>) -> Void) {
        guard let url = URL(string: "https://snappystudio.com.br/api/cities") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(.success(cities))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
