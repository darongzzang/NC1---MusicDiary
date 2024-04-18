//
//  TestView.swift
//  NC1-test
//
//  Created by 김이예은 on 4/18/24.
//

import SwiftUI

struct TestView: View {
    @Bindable var selectedItem: SelectedSong
    
    public func dateformat(pDate: Date, withFormat format: String) -> String { //날짜 형식 맞춰 불러오기
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일 EEEE"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: pDate)
    }
    
    var body: some View {
        Text(selectedItem.date, format: Date.FormatStyle(date: .numeric, time: .standard))
        Text(selectedItem.writing)
        Text(selectedItem.song.title)
    }
}
