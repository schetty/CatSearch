import SwiftUI
import SwiftData

struct CatListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Cat.id, order: .forward) private var allCats: [Cat]
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.filteredCats, id: \.self) { cat in
                        NavigationLink(destination: CatDetailsView(cat: cat,
                                                                   viewModel: CatDetailsViewModel(cat: cat)).toolbarRole(.editor)
                        ) {
                            HStack {
                                Text(cat.name ?? Constants.Strings.NameNotAvailable).font(Constants.Fonts.GeneralSans)
                            }
                        }
                    }.listRowBackground(Color.clear)
                }.scrollContentBackground(.hidden)
                    .background(LinearGradient(gradient: Gradient(colors: [.peach, .aquamarine, .white, .white]),
                                               startPoint: .top,
                                               endPoint: .bottom).ignoresSafeArea()
                    )
                    .onAppear {
                        if allCats.isEmpty {
                            Task {
                                await viewModel.loadCats(from: context)
                                do {
                                    try context.save()
                                } catch {
                                    print("Failed to save context: \(error)")
                                }
                            }
                        } else {
                            viewModel.cats = allCats
                        }
                    }
                    .navigationTitle(Constants.Strings.ListTitle)
                    .searchable(text: $viewModel.searchText)
            }
        }
    }
}
