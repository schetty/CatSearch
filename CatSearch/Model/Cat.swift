//
//  Cat.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import Foundation
import SwiftData

// MARK: - Cats
@Model

final class Cat: Codable, Identifiable {
    @Attribute(.unique) let id: String?
    let name: String?
    let temperament: String?
    let origin: String?
    let catDescription: String?
    let altNames: String?
    let wikipediaURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case origin
        case catDescription = "description"
        case altNames = "alt_names"
        case wikipediaURL = "wikipedia_url"
    }
    
    init(id: String?,
         name: String?,
         temperament: String?,
         origin: String?,
         catDescription: String?,
         altNames: String?,
         wikipediaURL: String?) {
        self.id = id
        self.name = name
        self.temperament = temperament
        self.origin = origin
        self.catDescription = catDescription
        self.altNames = altNames
        self.wikipediaURL = wikipediaURL
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        temperament = try container.decodeIfPresent(String.self, forKey: .temperament)
        origin = try container.decodeIfPresent(String.self, forKey: .origin)
        catDescription = try container.decodeIfPresent(String.self, forKey: .catDescription)
        altNames = try container.decodeIfPresent(String.self, forKey: .altNames)
        wikipediaURL = try container.decodeIfPresent(String.self, forKey: .wikipediaURL)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(temperament, forKey: .temperament)
        try container.encode(origin, forKey: .origin)
        try container.encode(catDescription, forKey: .catDescription)
        try container.encode(altNames, forKey: .altNames)
        try container.encode(wikipediaURL, forKey: .wikipediaURL)
    }
}


// MARK: - CatImage

struct CatImage: Codable {
    let id: String?
    let url: String?
}

extension CatImage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: CatImage, rhs: CatImage) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Hashable

extension Cat: Hashable {
    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
