//
//  CatDetailsViewModel.swift
//  CatSearch
//
//  Created by Naomi on 19/05/2024.
//

import Foundation

@MainActor
final class CatDetailsViewModel: ObservableObject {
    
    // MARK: - Properties
    let cat: Cat
    @Published var isLoading: Bool
    @Published private(set) var images: [CatImage] = []
    
    // MARK: - Initializer
    init(isLoading: Bool = true, cat: Cat) {
        self.isLoading = isLoading
        self.cat = cat
    }
    
    func loadImages() async {
        guard let id = cat.id else { return }
        guard let images: [CatImage] = await APIManager.shared.fetchCats(fromURL: Constants.APIConstants.BreedImages + id + Constants.APIConstants.BreedImagesPostBreedId) else { return }
        await MainActor.run {
            self.images = images
        }
    }
}
