//
//  MusicSelectView.swift
//  NC1-test
//
//  Created by 김이예은 on 4/18/24.
//

import SwiftUI
import SwiftData



struct MusicSelectView: View {
    @Binding var modalUp: Bool
    @State var isPressed: Bool = false
    @State public var id: Song = dummySongs[0]
    @Binding var typingText: String
    @Binding var selectedItemId: UUID?
    
    var body: some View{
        NavigationView {
            VStack{
                //검색 기능 넣기
                List(dummySongs, id: \.id) { song in
                    NavigationLink(destination: WritingView(id: $id, modalUp: $modalUp, typingText: $typingText)){
                        HStack{
                            Image(song.albumCoverImage)
                                .resizable()
                                .frame(width: (isPressed ? 104 : 56), height: (isPressed ? 104 : 56))
                                .cornerRadius(5)
                            VStack(alignment: .leading) {
                                Text(song.title)
                                    .font(.headline)
                                Text(song.artist)
                                    .font(.subheadline)
    //                            if (isPressed == true) {
    //                                Text(song.albumName)
    //                                    .font(.footnote)
    //                            }
                            }
                            Spacer()
                            if (song.star == false){
                                Image(systemName: "star").foregroundColor(.secondary)
                            }else {
                                Image(systemName: "star.fill").foregroundColor(.secondary)
                            }
                        }
    //                    .onLongPressGesture(perform: {isPressed.toggle()})
                        .contextMenu {
                            Link(destination: URL(string: song.albumInfoURL)!){
                                Text("앨범으로 이동")
                                Image(systemName: "music.note.house").foregroundColor(.secondary)
                            }
                            Button(action: {
                                print("즐겨찾기 눌림")
//                                song.star
                            }, label: {
                                Text("즐겨찾기")
                                Image(systemName: "star").foregroundColor(.secondary)
                            })
                            Button(action: {
                                print("크레딧 보기 눌림")
                            }, label: {
                                Text("크레딧 보기")
                                Image(systemName: "info.circle").foregroundColor(.secondary)
                            })
                        }
    //                    .gesture(
    //                        LongPressGesture()
    //                            .onChanged { _ in
    //                                self.isPressed = true
    //                            }
    //                            .onEnded { _ in
    //                                self.isPressed = false
    //                            }
    //                    )
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        id = song
                        })
                }.padding(.top, 20)
                
            }.navigationBarItems(trailing: Button(action: {
                print("닫기 눌림")
//                userDefaults = id
                modalUp = false
            }, label: {
                Text("닫기")
                    .font(.system(size: 17))
            }))
            .navigationTitle("음악을 선택하세요")
        }
    }

    }


