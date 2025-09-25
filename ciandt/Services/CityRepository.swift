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

class CityRepository: CityRepositoryProtocol {
    func fetchCities() async throws -> [City] {
        let url = URL(string: "https://snappystudio.com.br/collections/city/1")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode([City].self, from: data)
        return decoded
    }
}

