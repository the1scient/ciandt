//
//  CityView.swift
//  ciandt
//
//  Created by GUILHERME FAGGION FABBRI on 25/09/25.
//

import SwiftUI

struct CityListView: View {
    @State private var cities: [City] = []
    
    var body: some View {
        NavigationStack {
            List(cities, id: \.id) { city in
                NavigationLink(value: city) {
                    Text(city.name)
                }
            }
            .navigationDestination(for: City.self) { city in
                CityDetailView(city: city)
            }
            .navigationTitle("Locais em São Paulo")
            .task {
                await loadCities()
            }
        }
    }
    
    private func loadCities() async {
        do {
            let url = URL(string: "https://snappystudio.com.br/collections/city/1")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([City].self, from: data)
            cities = decoded
        } catch {
            print("Erro ao carregar cidades: \(error)")
        }
    }
}
