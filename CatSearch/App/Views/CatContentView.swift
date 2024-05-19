import SwiftUI

struct CatContentView: View {
    var body: some View {
        TabView {
            CatListView(viewModel: CatListViewModel())
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
            
            Text(Constants.Strings.Favs)
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
                .badge(7)
        }
    }
}

