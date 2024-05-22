import SwiftUI
import SwiftData
import Lottie

struct CatBreedListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Cat.id, order: .forward) private var allCats: [Cat]
    @ObservedObject var viewModel: CatBreedListViewModel
    @State private var isLoading: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                if isLoading {
                    LottieView(name: "loader",
                               loopMode: .loop)
                    .scaledToFit()
                } else {
                    List {
                        ForEach(viewModel.filteredCats, id: \.self) { cat in
                            NavigationLink(destination: CatBreedDetailsView(cat: cat,
                                                                       viewModel: CatBreedDetailsViewModel(cat: cat)).toolbarRole(.editor)
                            ) {
                                HStack {
                                    Text(cat.name ?? Constants.Strings.NameNotAvailable).font(Constants.Fonts.GeneralSans)
                                }
                            }
                        }.listRowBackground(Color.clear)
                    }.scrollContentBackground(.hidden)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.peach, .aquamarine, .white, .white]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                        )
                        .navigationTitle(Constants.Strings.ListTitle)
                        .searchable(text: $viewModel.searchText)
                    
                }
            }
        }.onAppear {
            if allCats.isEmpty {
                Task {
                    await viewModel.loadCats(from: context)
                    do {
                        try context.save()
                    } catch {
                        print("Failed to save context: \(error)")
                    }
                    dismissLoader()
                }
            } else {
                viewModel.cats = allCats
                dismissLoader()
            }
        }
    }
    
    private func dismissLoader() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoading = false
        }
    }
}
