//
//  selectedSong.swift
//  NC1-test
//
//  Created by 김이예은 on 4/14/24.
//

import SwiftUI
import SwiftData

@Model
final class SelectedSong: Identifiable, Hashable {
    var id: UUID
    var song: Song
    var date: Date
    var writing: String
    var writeType: String
    
    init(Song: Song, Date: Date, Writing: String, WriteType: String) {
        self.id = UUID()
        self.song = Song
        self.date = Date
        self.writing = Writing
        self.writeType = WriteType
    }
}

