//
//  CityListViewModel.swift
//  ciandt
//
//  Created by GUILHERME FAGGION FABBRI on 25/09/25.
//

import Foundation

@MainActor
class CityListViewModel: ObservableObject {
    @Published var cities: [City] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository: CityRepositoryProtocol

    init(repository: CityRepositoryProtocol = CityRepository() as! CityRepositoryProtocol) {
        self.repository = repository
    }

    func fetchCities() async {
        isLoading = true
        errorMessage = nil
        do {
            cities = try await repository.fetchCities()
        } catch {
            errorMessage = "Erro ao carregar cidades."
        }
        isLoading = false
    }
}
