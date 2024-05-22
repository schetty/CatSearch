import SwiftUI
import SwiftData

struct CatContentView: View {
    
    // MARK: - Properties
    @StateObject var catListViewModel: CatListViewModel = .init()
    @StateObject var catFavoritesViewModel: CatFavoritesViewModel = .init()

    var body: some View {
        TabView {
            CatListView(viewModel: catListViewModel)
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
            
            
            CatFavouritesView(viewModel: catFavoritesViewModel)
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
                .badge(catFavoritesViewModel.favoriteCats.count)
        }
    }
}
