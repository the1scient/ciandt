//
//  City.swift
//  ciandt
//
//  Created by GUILHERME FAGGION FABBRI on 25/09/25.
//

struct City: Identifiable, Codable, Hashable {
    let id: Int
    let version: Int
    let name: String
    let description: String
    let image: String
    let latitude: Double
    let longitude: Double
    let color: String
    let icon: String
    let tasksCount: Int
}
