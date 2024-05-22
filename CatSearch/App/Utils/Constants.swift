//
//  Constants.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import SwiftUI

struct Constants {
    
    struct APIConstants {
        static let Host = "https://api.thecatapi.com"
        static let ApiKey = "live_xIFi0QXMVkdUEvOaK7Qm6QcOnOxLz4XrQKAUuGxaQPEKmZeAZmFL84w7duwT8rez"
        static let Breeds = Host + "/v1/breeds"
        static let BreedImages = Host + "/v1/images/search?limit=10&breed_ids="
        static let BreedImagesPostBreedId = "&api_key=\(ApiKey))"
    }
    
    struct Strings {
        static let ListTitle = "Select a cat breed"
        static let NameNotAvailable = "No cat name is available"
        static let Home = "Home"
        static let Favs = "Favourites"
        static let CatDetails = "Cat Details"
        static let Temperament = "Temperament: "
        static let Description = "Description: "
        static let Origin = "Origin: "
        static let WikipediaPage = "Wikipedia Page"
        
    }
    
    struct Fonts {
        static let GeneralSans = Font.custom("GeneralSans-Regular", size: 15.0)
        static let GeneralSansLight = Font.custom("GeneralSans-Light", size: 15.0)
        static let GeneralSansMedium = Font.custom("GeneralSans-Medium", size: 15.0)
        static let GeneralSansBold = Font.custom("GeneralSans-Bold", size: 25.0)
    }
}

