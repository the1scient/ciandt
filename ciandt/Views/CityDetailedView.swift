//
//  CityDetailedView.swift
//  ciandt
//
//  Created by GUILHERME FAGGION FABBRI on 25/09/25.
//

import SwiftUI

struct CityDetailView: View {
    let city: City
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
 
                
                
                AsyncImage(url: URL(string: city.image)) { status in
                    if let image = status.image {
                        image
                            .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(height: 200)
                          .frame(maxWidth: .infinity)
                          .clipped()
                          .cornerRadius(20)
                    } else if status.error != nil {
                        // se houver erro, vai exibir um retangulo cinza
                        Color.gray.frame(height: 200)
                            .cornerRadius(20)
                    } else {
                        ProgressView().frame(height: 200)
                    }
                }
                
                
                Text(city.name)
                    .font(.largeTitle)
                    .foregroundStyle(Color(hex: "\(city.color)"))
                    .bold()
                    .accessibilityIdentifier("cityDetailTitle")
                
                //        if let description = city.description {
                //    Text(description)
                //      .font(.body)
                //   }
                
                Text(city.description)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview() {
    CityDetailView(city: City(id: 10, version: 1, name: "Centro Universitário Senac", description: "O Senac Nações Unidas é uma unidade dentro do Centro Universitário Senac em Santo Amaro, que se destaca por sua infraestrutura moderna e diversificada, incluindo prédios acadêmicos com salas de aula e laboratórios, um centro gastronômico e de convenções, um laboratório de design e uma biblioteca. O espaço, que abrange 154 mil metros quadrados, é projetado para estimular a interação e possui um centro esportivo e academia.", image: "https://snappystudio.com.br/images/collections/CentroUniversitárioSenac/senacsp.webp", latitude: -23.6697857305156, longitude: -46.7012430776255, color: "#ff0000", icon: "https://snappystudio.com.br/images/collections/CentroUniversitárioSenac/senacsp-icon.webp", tasksCount: 1))
}
