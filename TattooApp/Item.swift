//
//  Item.swift
//  TattooApp
//
//  Created by Vibu Darshan on 5/9/24.
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
