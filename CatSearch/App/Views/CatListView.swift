import SwiftUI
import SwiftData

struct CatListView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredCats) { cat in
                NavigationLink(destination: CatDetailsView(cat: cat,
                                                           viewModel: CatDetailsViewModel(cat: cat))) {
                    HStack {
                        Text(cat.name ?? Constants.Strings.NameNotAvailable)
                    }
                }
            }
            .onAppear {
                if viewModel.cats.isEmpty {
                    Task {
                        await self.viewModel.loadCats()
                    }
                }
            }
            .navigationTitle(Constants.Strings.ListTitle)
            .searchable(text: $viewModel.searchText)
        }
    }
}
