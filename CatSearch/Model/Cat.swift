//
//  Cat.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import SwiftData

typealias Cats = [Cat]

// MARK: - Cats
@Model
final class Cat: Codable {
    
  @Attribute(.unique) let id: String?
  let name: String?
  let temperament: String?
  let origin: String?
  let catDescription: String?
  let altNames: String?
  let wikipediaURL: String?
  let image: CatImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case origin
        case catDescription = "description"
        case altNames
        case wikipediaURL
        case image
    }
    
    init(id: String?,
         name: String?,
         temperament: String?,
         origin: String?,
         catDescription: String?,
         altNames: String?,
         wikipediaURL: String?,
         image: CatImage?) {
        self.id = id
        self.name = name
        self.temperament = temperament
        self.origin = origin
        self.catDescription = catDescription
        self.altNames = altNames
        self.wikipediaURL = wikipediaURL
        self.image = image
    }

    required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           id = try container.decode(String.self, forKey: .id)
           name = try container.decode(String.self, forKey: .name)
           temperament = try container.decode(String.self, forKey: .temperament)
           origin = try container.decode(String.self, forKey: .origin)
           catDescription = try container.decode(String.self, forKey: .catDescription)
           altNames = try container.decode(String.self, forKey: .altNames)
           wikipediaURL = try container.decode(String.self, forKey: .wikipediaURL)
           image = try container.decode(CatImage.self, forKey: .image)
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
           try container.encode(image, forKey: .image)
       }
}

// MARK: - CatImage

struct CatImage: Codable {
    let id: String?
    let url: String?
}

// MARK: - Hashable

extension Cat: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: Cat, rhs: Cat) -> Bool {
    lhs.id == rhs.id
  }
}
