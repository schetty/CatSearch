//
//  CatDetailsView.swift
//  CatSearch
//
//  Created by Naomi on 19/05/2024.
//

import SwiftUI

struct CatDetailsView: View {
    let cat: Cat

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(cat.name ?? Constants.Strings.NameNotAvailable)
                .font(.title)
                .bold()
            Text("Temperament: \(cat.temperament ?? "N/A")")
            Text("Origin: \(cat.origin ?? "N/A")")
            Text("Description: \(cat.catDescription ?? "N/A")")
            if let url = cat.wikipediaURL, let wikiURL = URL(string: url) {
                Link("Wikipedia", destination: wikiURL)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .navigationTitle(cat.name ?? Constants.Strings.NameNotAvailable)
    }
}
