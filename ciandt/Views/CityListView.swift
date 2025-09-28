//
//  CityView.swift
//  ciandt
//
//  Created by GUILHERME FAGGION FABBRI on 25/09/25.
//

import SwiftUI

struct CityListView: View {
    @StateObject private var viewModel = CityListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Carregando locais 😄 ...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                } else {
                    List(viewModel.cities, id: \.id) { city in
                        NavigationLink(value: city) {
                            HStack(spacing: 8) {
                                AsyncImage(url: URL(string: city.icon)) { status in
                                    if let image = status.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                            .cornerRadius(8)
                                    } else {
                                        Color.gray.frame(width: 40, height: 40)
                                    }
                                }
                                
                                Text(city.name)
                                  
                            }
                        }
                        .accessibilityIdentifier("local_\(city.id)") 
                    }
                }
            }
            .navigationDestination(for: City.self) { city in
                CityDetailView(city: city)
            }
            .navigationTitle("Locais em São Paulo")
        }
        .task {
            await viewModel.fetchCities()
        }
    }
}


#Preview() {
    CityListView()
}
