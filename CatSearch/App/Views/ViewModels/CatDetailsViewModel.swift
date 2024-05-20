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
    private let favoritesKey = "favorites"
    
    
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

    func toggleFavorite(cat: Cat) {
        var favorites = getFavorites()
        if let index = favorites.firstIndex(where: { $0.id == cat.id }) {
            favorites.remove(at: index)
        } else {
            favorites.append(cat)
        }
        saveFavorites(favorites: favorites)
    }

    func isFavorite(cat: Cat) -> Bool {
        let favorites = getFavorites()
        return favorites.contains { $0.id == cat.id }
    }

    private func getFavorites() -> [Cat] {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey),
              let favorites = try? JSONDecoder().decode([Cat].self, from: data) else {
            return []
        }
        return favorites
    }

    private func saveFavorites(favorites: [Cat]) {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
}
