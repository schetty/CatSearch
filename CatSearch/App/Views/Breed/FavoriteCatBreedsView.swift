import SwiftUI

struct FavoriteCatBreedsView: View {
    @ObservedObject var viewModel: FavouriteCatBreedsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.favoriteCats, id: \.self) { cat in
                        NavigationLink(destination: CatBreedDetailsView(cat: cat,
                                                                   viewModel: CatBreedDetailsViewModel(cat: cat)).toolbarRole(.editor)
                        ) {
                            HStack {
                                Text(cat.name ?? Constants.Strings.NameNotAvailable).font(Constants.Fonts.GeneralSans)
                                Spacer()
                            }
                        }.navigationTitle(Constants.Strings.Favs).font(Constants.Fonts.GeneralSansBold)
                    }.listRowBackground(Color.clear)
                }.scrollContentBackground(.hidden)
                .onAppear {
                    viewModel.loadFavoriteCats()
                }
            }.background(LinearGradient(gradient: Gradient(colors: [.aquamarine, .peach, .white, .white, .white]),
                                        startPoint: .top,
                                        endPoint: .bottom).ignoresSafeArea())
        }
    }
}

struct CatFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCatBreedsView(viewModel: FavouriteCatBreedsViewModel())
    }
}
