//
//  Constants.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import Foundation

struct Constants {
    
    struct APIConstants {
        static let Host = "https://api.thecatapi.com"
        static let ApiKey = "live_xIFi0QXMVkdUEvOaK7Qm6QcOnOxLz4XrQKAUuGxaQPEKmZeAZmFL84w7duwT8rez"
        static let Breeds = Host + "/v1/breeds"
        static let BreedImages = "/v1/images/search?limit=10&breed_ids="
        static let BreedImagesPostBreedId = "&api_key=\(ApiKey))"
    }
    
    struct Strings {
        static let ListTitle = "Select a cat breed"
        static let NameNotAvailable = "No cat name is available"
    }
}

