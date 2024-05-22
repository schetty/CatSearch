//
//  CatFavouritesViewModel.swift
//  CatSearch
//
//  Created by Naomi on 21/05/2024.
//

import Foundation

final class FavouriteCatBreedsViewModel: ObservableObject {
    @Published var favoriteCats: [Cat] = []
    private let favoritesKey = "favorites"
    
    
    // MARK: - Initializer
    init(cats: [Cat] = []) {
        loadFavoriteCats()
    }

    func loadFavoriteCats() {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey),
              let favorites = try? JSONDecoder().decode([Cat].self, from: data) else {
            favoriteCats = []
            return
        }
        favoriteCats = favorites
    }

    func updateFavoriteCats() {
        loadFavoriteCats()
    }
}
