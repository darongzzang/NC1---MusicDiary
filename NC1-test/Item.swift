//
//  Item.swift
//  NC1-test
//
//  Created by 김이예은 on 4/14/24.
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
