//
//  ViewWriting.swift
//  NC1-Final
//
//  Created by 김이예은 on 4/18/24.
//

import SwiftUI
import SwiftData


struct ViewWriting: View {
    //    @Binding var id: Song
    
//    var selectedItem: SelectedSong
//    @Binding var selectedItemId: SelectedSong
    
    public func dateformat(pDate: Date, withFormat format: String) -> String { //날짜 형식 맞춰 불러오기
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일 EEEE"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: pDate)
    }
    //    var today = Date()
    @Bindable var selectedItem: SelectedSong
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20){
                VStack(alignment: .leading, spacing: 13){
                    HStack(alignment: .center, spacing: 16){
                        Image(selectedItem.song.albumCoverImage)
                            .resizable()
                            .frame(width: 87, height: 87)
                            .cornerRadius(7)
                        VStack(alignment: .leading, spacing: 0) {
                            Text(selectedItem.song.title)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Text(selectedItem.song.artist)
                                .font(.system(size: 20))
                                .foregroundColor(.white.opacity(0.6))
                        }
                        Spacer()
                    }
                }
                Text(selectedItem.writing)
                    .font(.system(size: 16))
                Text(dateformat(pDate: selectedItem.date, withFormat: "YYYY년 M월 N일 EEEE hh시 m분 씀"))
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.67))
            }
    }
}
