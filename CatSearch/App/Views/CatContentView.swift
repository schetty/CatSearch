import SwiftUI

struct CatContentView: View {
    @StateObject private var viewModel = CatListViewModel()

    var body: some View {
        TabView {
            CatListView(viewModel: viewModel).toolbarRole(.editor)
                .tabItem {
                    Label {
                        Text(Constants.Strings.ListTitle).font(Constants.Fonts.GeneralSans)
                    } icon: {
                        Image(systemName: "list.dash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                }

            Text(Constants.Strings.Home)
                .tabItem {
                    Label {
                        Text(Constants.Strings.Home).font(Constants.Fonts.GeneralSans)
                    } icon: {
                        Image("cathome")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                }
            
            CatFavouritesView(viewModel: viewModel).toolbarRole(.editor)
                .tabItem {
                    Label {
                        Text(Constants.Strings.Favs).font(Constants.Fonts.GeneralSans)
                    } icon: {
                        Image("catlove")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                }
                .badge(viewModel.favoriteCats.count)
        }
    }
}
