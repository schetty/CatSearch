import SwiftUI

struct CatDetailsView: View {
    let cat: Cat
    var columns: [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]
    
    @ObservedObject var viewModel: CatDetailsViewModel
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(cat.name ?? Constants.Strings.NameNotAvailable)
                            .font(.title)
                            .bold()
                        Spacer()
                        Button(action: {
                            isFavorite.toggle()
                            viewModel.toggleFavorite(cat: cat)
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .red : .gray)
                                .imageScale(.large)
                        }
                    }
                    Text("Temperament: \(cat.temperament ?? "N/A")")
                    Text("Origin: \(cat.origin ?? "N/A")")
                    Text("Description: \(cat.catDescription ?? "N/A")")
                    if let url = cat.wikipediaURL, let wikiURL = URL(string: url) {
                        Link("Wikipedia", destination: wikiURL)
                            .foregroundColor(.blue)
                    }
                    LazyVGrid(columns: self.columns) {
                        ForEach(self.viewModel.images, id: \.self) { image in
                            if let url = image.url {
                                AsyncImage(url: URL(string: url)) { result in
                                    result.image?
                                        .resizable()
                                        .scaledToFill()
                                }
                                .frame(width: 110, height: 110)
                                .cornerRadius(25)
                                .aspectRatio(contentMode: .fill)
                            }
                        }
                    }
                }
            }.padding()
                .onAppear {
                    Task {
                        await self.viewModel.loadImages()
                        isFavorite = viewModel.isFavorite(cat: cat)
                    }
                }
                .navigationTitle(Constants.Strings.CatDetails)
        }.background(LinearGradient(gradient: Gradient(colors: [.peach, .aquamarine, .white, .white, .white]),
                                    startPoint: .top,
                                    endPoint: .bottom).ignoresSafeArea())
    }
}
