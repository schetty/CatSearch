//
//  CatDetailsView.swift
//  CatSearch
//
//  Created by Naomi on 19/05/2024.
//

import SwiftUI

struct CatDetailsView: View {
    let cat: Cat
    var columns: [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]
    
    @ObservedObject var viewModel: CatDetailsViewModel
    
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
            ScrollView {
                LazyVGrid(columns: self.columns) {
                    ForEach(self.viewModel.images, id: \.self) { image in
                        if let url = image.url {
                            AsyncImage(url: URL(string: url)) { result in
                                result.image?
                                    .resizable()
                                    .scaledToFill()
                            }
                            .frame(width: 110,
                                   height: 110)
                            .cornerRadius(25)
                            .aspectRatio(contentMode: .fill)
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            Task {
                await self.viewModel.loadImages()
            }
        }
        .navigationTitle(Constants.Strings.CatDetails)
    }
}
