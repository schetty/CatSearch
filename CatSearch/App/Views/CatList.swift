//
//  CatList.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import SwiftUI
import SwiftData

struct CatList: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var cats: Cats
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        List(viewModel.cats) { cat in
            Text(cat.name ?? Constants.Strings.nameNotAvailable)
        }
        .onAppear {
            if viewModel.cats.isEmpty {
                Task {
                    await self.viewModel.loadCats()
                }
            }
        }
    }
    
    private func saveCat(cat: Cat) {
        withAnimation {
            modelContext.insert(cat)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(cats[index])
            }
        }
    }
}
