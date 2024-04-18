//
//  TestView.swift
//  NC1-test
//
//  Created by 김이예은 on 4/18/24.
//

import SwiftUI

struct TestView: View {
    @Bindable var selectedItem: SelectedSong
    var today = Date()
    
    public func dateformat2(pDate: Date, withFormat format: String) -> String { //날짜 형식 맞춰 불러오기
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일 a h시 m분 씀"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: pDate)
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 13){
            HStack(alignment: .center, spacing: 16) {
                Image(selectedItem.song.albumCoverImage)
                    .resizable()
                    .frame(width: 87, height: 87)
                    .cornerRadius(7)
                VStack (alignment: .leading, spacing: 0){
                    Text(selectedItem.song.title)
                        .fontWeight(.bold)
                        .font(.system(size:20))
                    Text(selectedItem.song.artist)
                        .fontWeight(.regular)
                        .font(.system(size:20))
                        .foregroundStyle(.white.opacity(0.6))
                }
                Spacer()
            }
            Text(selectedItem.writing)
                .font(.system(size:16))
                .foregroundStyle(.white)
            VStack (alignment: .leading){
                Text(dateformat2(pDate: today, withFormat: "YYYY년 M월 d일 a h시 m분 씀"))
                    .font(.system(size:14))
                    .foregroundStyle(.white.opacity(0.6))
                Button {
                    print("과연.. 구현할 수 있을지")
                } label: {
                    Text("수정하기")
                        .font(.system(size:14))
                        .foregroundStyle(.accent)
                }
            }

            Spacer()
        }
        .padding()
    }
}
