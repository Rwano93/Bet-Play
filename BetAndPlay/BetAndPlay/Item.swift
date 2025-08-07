//
//  Item.swift
//  BetAndPlay
//
//  Created by Erwan gueganic on 08/08/2025.
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
