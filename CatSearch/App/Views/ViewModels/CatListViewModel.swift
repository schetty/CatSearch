//
//  CatListViewModel.swift
//  CatSearch
//
//  Created by User on 5/16/24.
//

import Foundation

@MainActor
final class CatListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoading: Bool
    @Published var moreCatsToLoad = true
    @Published private(set) var cats: Cats = []
    
    private(set) var page = 0
    
    // MARK: - Initializer
    init(isLoading: Bool = true) {
        self.isLoading = isLoading
    }
    
    func loadCats() async {
        guard let cats: Cats = await APIManager.shared.fetchCats(fromURL: Constants.APIConstants.breeds) else { return }
        await MainActor.run {
            self.cats = cats
        }
    }
}
