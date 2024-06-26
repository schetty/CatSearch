import SwiftUI

struct CatBreedDetailsView: View {
    
    // MARK: - Properties
    let cat: Cat
    var columns: [GridItem] = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]
    
    @ObservedObject var viewModel: CatBreedDetailsViewModel
    @State private var isFavorite: Bool = false
    @State private var scale: CGFloat = 1.0
    
    
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
                            withAnimation {
                                self.scale *= isFavorite ? 1.5 : 0.7
                            }
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .red : .gray)
                                .imageScale(.large)
                        }.scaleEffect(scale)
                    }.padding(14)
                    
                    // MARK: - Cat Details Text + Wikipedia Link
                    Text(Constants.Strings.Temperament + "\(cat.temperament ?? "N/A")").font(Constants.Fonts.GeneralSansMedium)
                    Text(Constants.Strings.Origin + "\(cat.origin ?? "N/A")").font(Constants.Fonts.GeneralSansMedium)
                    Text(Constants.Strings.Description +  "\(cat.catDescription ?? "N/A")").font(Constants.Fonts.GeneralSansMedium)
                    
                    if let url = cat.wikipediaURL, let wikiURL = URL(string: url) {
                        Link(Constants.Strings.WikipediaPage, destination: wikiURL)
                            .foregroundColor(.mauve)
                    }
                    
                    // MARK: - Cat Images in LazyVGrid
                    LazyVGrid(columns: self.columns) {
                        ForEach(self.viewModel.images, id: \.self) { image in
                            if let urlString = image.url, let url = URL(string: urlString) {
                                AsyncImageView(imageUrl: url)
                                    .frame(width: 110,
                                           height: 110)
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
                }.navigationTitle(Constants.Strings.CatBreedDetails).font(Constants.Fonts.GeneralSansBold)
                .background(LinearGradient(gradient: Gradient(colors: [.peach, .aquamarine, .white, .white]),
                                           startPoint: .top,
                                           endPoint: .bottom).ignoresSafeArea()
                )
        }
    }
}
