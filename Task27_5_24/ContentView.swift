//
//  ContentView.swift
//  Task27_5_24
//
//  Created by Vrushik on 27/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CityDataViewModel()
    @State private var expandedSections: Set<String> = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.groupedCities.keys.sorted(), id: \.self) { adminName in
                    Section(header: HStack {
                        Text(adminName)
                            .font(.headline)
                        Spacer()
                        Image(systemName: expandedSections.contains(adminName) ? "chevron.down" : "chevron.right")
                            .onTapGesture {
                                withAnimation {
                                    toggleSection(adminName)
                                }
                            }
                    }) {
                        if expandedSections.contains(adminName) {
                            ForEach(viewModel.groupedCities[adminName] ?? []) { city in
                                VStack(alignment: .leading) {
                                    Text(city.city)
                                        .font(.headline)
                                    Text("Population: \(city.population)")
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Australian Cities")
        }
    }
    
    private func toggleSection(_ adminName: String) {
        if expandedSections.contains(adminName) {
            expandedSections.remove(adminName)
        } else {
            expandedSections.insert(adminName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
