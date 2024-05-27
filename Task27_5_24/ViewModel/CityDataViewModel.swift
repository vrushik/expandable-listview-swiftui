//
//  CityDataViewModel.swift
//  Task27_5_24
//
//  Created by Vrushik on 27/05/24.
//

import Foundation
class CityDataViewModel: ObservableObject {
    @Published var groupedCities: [String: [city_Model]] = [:]

    init() {
        loadJSON()
    }

    func loadJSON() {
        if let url = Bundle.main.url(forResource: "au_cities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let cities = try JSONDecoder().decode([city_Model].self, from: data)
                groupCitiesByAdminName(cities)
            } catch {
                print("Failed to load or decode JSON: \(error)")
            }
        }
    }
    
    func groupCitiesByAdminName(_ citis: [city_Model]) {
        groupedCities = Dictionary(grouping: citis, by: { $0.admin_name })
    }

}
