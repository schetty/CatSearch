import SwiftUI

struct CatFavouritesView: View {
    @ObservedObject var viewModel: CatFavoritesViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(viewModel.favoriteCats, id: \.self) { cat in
                        NavigationLink(destination: CatDetailsView(cat: cat,
                                                                   viewModel: CatDetailsViewModel(cat: cat)).toolbarRole(.editor)
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
        CatFavouritesView(viewModel: CatFavoritesViewModel())
    }
}
