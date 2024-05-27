//
//  cityModel.swift
//  Task27_5_24
//
//  Created by Vrushik on 27/05/24.
//

import Foundation
struct city_Model : Identifiable, Codable {
    var id = UUID()
    let city: String
    let lat: String
    let lng: String
    let country: String
    let iso2: String
    let admin_name: String
    let capital: String
    let population: String
    let population_proper: String
    
    enum CodingKeys: String, CodingKey {
        case city, lat, lng, country, iso2, admin_name, capital, population, population_proper
    }

}
