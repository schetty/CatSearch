//
//  AsyncImageView.swift
//  CatSearch
//
//  Created by Naomi on 20/05/2024.
//

import SwiftUI

struct AsyncImageView: View {
    var imageUrl: URL

    var body: some View {
        AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFill()
            case .failure:
                Image(systemName: "catsearch-bw")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            @unknown default:
                fatalError()
            }
        }
    }
}
