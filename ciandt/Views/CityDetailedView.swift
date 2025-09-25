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
        VStack(alignment: .leading, spacing: 16) {
            Text(city.name)
                .font(.largeTitle)
                .bold()

//            if let description = city.description {
//                Text(description)
//                    .font(.body)
//            }

            Text(city.description)
            
            Spacer()
        }
        .padding()
        .navigationTitle(city.name)
    }
}

#Preview() {
    CityDetailView(city: City(id: 1, version: 1, name: "", description: "", image: "", latitude: 2, longitude: 2, color: "", icon: "", tasksCount: 1))
}
