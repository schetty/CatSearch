import SwiftUI
import SwiftData

@MainActor
final class CatListViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    @Published var searchText: String = ""
    
    var filteredCats: [Cat] {
        if searchText.isEmpty {
            return cats
        } else {
            return cats.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }
    
    func loadCats(from context: ModelContext) async {
        guard let loadedCats: [Cat] = await APIManager.shared.fetchCats(fromURL: Constants.APIConstants.Breeds) else { return }
        await MainActor.run {
            loadedCats.forEach { cat in
                context.insert(cat)
            }
            self.cats = loadedCats
        }
    }
}
