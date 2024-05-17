//
//  Constants.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import Foundation

struct Constants {
    
    struct APIConstants {
        static let host = "https://api.thecatapi.com"
        static let apiKey = "live_xIFi0QXMVkdUEvOaK7Qm6QcOnOxLz4XrQKAUuGxaQPEKmZeAZmFL84w7duwT8rez"
        static let breeds = host + "/v1/breeds"
        static let breedImages = "/v1/images/search?limit=10&breed_ids="
        static let breedImagesPostBreedId = "&api_key=\(apiKey))"
    }
    
    struct Strings {
        static let nameNotAvailable = "No cat name is available"
    }
}

