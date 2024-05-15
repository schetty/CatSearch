//
//  Item.swift
//  CatSearch
//
//  Created by Naomi on 5/15/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
