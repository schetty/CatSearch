import SwiftUI
import SwiftData

struct CatListView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.cats, id: \.self) { cat in
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
}
