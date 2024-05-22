import SwiftUI
import SwiftData

struct CatContentView: View {
    
    // MARK: - Properties
    @StateObject var catBreedListViewModel: CatBreedListViewModel = .init()
    @StateObject var favouriteCatBreedsViewModel: FavouriteCatBreedsViewModel = .init()

    var body: some View {
        TabView {
            CatBreedListView(viewModel: catBreedListViewModel)
                .toolbarRole(.editor)
                .tabItem {
                    Label {
                        Text(Constants.Strings.Home).font(Constants.Fonts.GeneralSans)
                    } icon: {
                        Image("cathome")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24,
                                   height: 24)
                    }
                }
            
            
            FavoriteCatBreedsView(viewModel: favouriteCatBreedsViewModel)
                .toolbarRole(.editor)
                .tabItem {
                    Label {
                        Text(Constants.Strings.Favs).font(Constants.Fonts.GeneralSans)
                    } icon: {
                        Image("catlove")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24,
                                   height: 24)
                    }
                }
                .badge(favouriteCatBreedsViewModel.favoriteCats.count)
        }
    }
}
