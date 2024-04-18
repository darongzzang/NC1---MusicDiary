//
//  WritingView.swift
//  NC1-test
//
//  Created by 김이예은 on 4/18/24.
//

import SwiftUI
import SwiftData




struct WritingView: View {
    @Environment(\.modelContext) var context
//    @Binding var selectedAlbumCover: String
//    @Binding var selectedTitle: String
//    @Binding var selectedArtist: String
    @Binding var id: Song
    @Binding var modalUp: Bool
    var writeType = ["빠른 메모", "긴 글 남기기"]
    @State var writingType: String = "빠른 메모"
    @Binding var typingText: String
//    @State var selectedItemId: UUID?
//    if let index = dummySongs.firstIndex(where: { $0.id == id }){
//        return dummySongs[index].albumCoverImage 아이디로 곡 정보를 찾으려다가 실패...
//    }
    @Query var items: [SelectedSong]
    
    public func addItems() {
        withAnimation {
            let newItem = SelectedSong(Song: id, Date: Date(), Writing: typingText, WriteType: writingType)
            context.insert(newItem)
        }
    }
    
    public func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(items[index])
            }
        }
    }
    
    var today = Date()
    public func dateformat(pDate: Date, withFormat format: String) -> String { //날짜 형식 맞춰 불러오기
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일 EEEE"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: pDate)
    }
    
    var body: some View{
        VStack{
            HStack (alignment: .center, spacing: 11){
                Image(id.albumCoverImage)
                    .resizable()
                    .frame(width: 57, height: 57)
                    .cornerRadius(7)
                VStack (alignment: .leading, spacing: 0){
                    Text(id.title) //선택된 리스트 항목의 타이틑
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(id.artist) //선택된 리스트 항목의 아티스트
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                
            }.frame(maxWidth: .infinity)
            .padding(12)
            .background(Color(red: 0.43, green: 0.43, blue: 0.43).opacity(0.5))
            .cornerRadius(16)
            
            Picker("",selection: $writingType) {
                ForEach(writeType, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(.segmented)
            ZStack {
                TextEditor(text: $typingText) //입력하는 곳
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
                    .padding(.top, 16)
                    .multilineTextAlignment(.leading)
                    .scrollContentBackground(.hidden)
//                    .background()
                if typingText.isEmpty {
                    VStack {
                        HStack {
                            Text("\(writingType)를 시작하세요...")
                                .padding(.top, 24)
                                .foregroundColor(.white.opacity(0.7))
                                .padding(.leading, 5)
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .navigationBarItems(trailing: Button(action: {
            print("저장")
//            selectedId = id
            modalUp = false
//            selectedItemId = UUID()
            addItems()
//            ModelContext.insert(newWriting)
        }, label: {
            Text("저장")
                .font(.system(size: 17))
        }))
        .toolbar{
            ToolbarItem(placement: .principal){
                Text(dateformat(pDate: today, withFormat: "M월 N일 EEEE"))
            }
        }
            .padding(.top, 20)
        .padding()
    }
}

