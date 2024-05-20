import SwiftUI

struct CatFavouritesView: View {
    @ObservedObject var viewModel: CatListViewModel

    var body: some View {
        NavigationView {
            List(viewModel.favoriteCats) { cat in
                NavigationLink(destination: CatDetailsView(cat: cat,
                                                           viewModel: CatDetailsViewModel(cat: cat))
                ) {
                    HStack {
                        Text(cat.name ?? Constants.Strings.NameNotAvailable)
                        Spacer()
                    }
                }
            }
            .navigationTitle(Constants.Strings.Favs)
        }
        .onAppear {
            viewModel.loadFavoriteCats()
        }
    }
}

struct CatFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        CatFavouritesView(viewModel: CatListViewModel())
    }
}
