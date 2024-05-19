import Foundation

@MainActor
final class CatListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoading: Bool
    @Published var moreCatsToLoad = true
    @Published private(set) var cats: Cats = []
    @Published var searchText: String = ""

    private(set) var page = 0
    
    // MARK: - Initializer
    init(isLoading: Bool = true) {
        self.isLoading = isLoading
    }
    
    func loadCats() async {
        guard let cats: Cats = await APIManager.shared.fetchCats(fromURL: Constants.APIConstants.Breeds) else { return }
        await MainActor.run {
            self.cats = cats
        }
    }

    var filteredCats: Cats {
        if searchText.isEmpty {
            return cats
        } else {
            return cats.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
}
