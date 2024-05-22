//
//  LottieLoader.swift
//  CatSearch
//
//  Created by Naomi on 22/05/2024.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    var name = "success"
    var loopMode: LottieLoopMode = .loop
    

    func makeUIView(context: Context) -> LottieAnimationView {
        let view = LottieAnimationView(name: "/loader.json", bundle: Bundle.main)
        view.loopMode = loopMode
        view.play()
        view.contentMode = .scaleAspectFit

        return view
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct LottieView_Previews: PreviewProvider {
    static var previews: some View {
        LottieView()
    }
}
