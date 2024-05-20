import SwiftUI

struct CatContentView: View {
    @StateObject private var viewModel = CatListViewModel()

    var body: some View {
        TabView {
            CatListView(viewModel: viewModel)
                .tabItem {
                    Label {
                        Text(Constants.Strings.ListTitle)
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
                        Text(Constants.Strings.Home)
                    } icon: {
                        Image("cathome")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                }
            
            CatFavouritesView(viewModel: viewModel)
                .tabItem {
                    Label {
                        Text(Constants.Strings.Favs)
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
