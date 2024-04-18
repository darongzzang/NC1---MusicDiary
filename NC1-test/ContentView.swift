//
//  ContentView.swift
//  NC1-test
//
//  Created by 김이예은 on 4/14/24.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    @Environment(\.modelContext) var context
    @State var modalUp: Bool = false
    @State var viewModalUp: Bool = false
    @State var typingText: String = ""
    @State var selectedItemId: UUID?
    @State var selectedItem: SelectedSong?
    
    @Query var items: [SelectedSong]
    
    public func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(items[index])
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack (alignment: .leading, spacing: 0){
                    Text("음악 기록")
                        .fontWeight(.bold)
                        .font(.system(size:32))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 46)
                    
                }
                VStack(alignment: .leading, spacing: 11) {
                    Spacer()
                    if (items == nil) {
                        Image(systemName: "pencil")
                            .foregroundStyle(.accent)
                            .font(.system(size: 40))
                        VStack(alignment:.center, spacing: 4) {
                            Text("음악 기록 남기기")
                                .font(.system(size: 22))
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            Text("나만의 음악 기록을 남겨보세요.\n 시작하려면 더하기 버튼을 탭하세요.")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.white.opacity(0.6))
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                    else {
                        List {
                            ForEach(items, id: \.date){ item in
                                NavigationLink(destination: TestView(selectedItem: item))
                                {
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(item.song.albumCoverImage)
                                                .resizable()
                                                .frame(width: 38, height: 38)
                                                .cornerRadius(7)
                                            VStack(alignment: .leading, spacing: 0) {
                                                Text(item.song.title)
                                                    .font(.system(size: 12))
                                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                                Text(item.song.artist)
                                                    .font(.system(size: 12))
                                                    .foregroundColor(.white.opacity(0.6))
                                            }
                                            Spacer()
                                            //                                    Button(action: {
                                            //                                        viewModalUp = true
                                            //                                        if let isItem = selectedItem  {
                                            //                                            selectedItem = item
                                            //
                                            //                                        }else {
                                            //                                            print("반영안됨")
                                            //                                            //더미 필요?
                                            //                                        }
                                            //                                    }, label: {
                                            //                                        Image(systemName: "chevron.right")
                                            //                                            .foregroundColor(.white)
                                            //                                    })
                                            
                                            //                                        NavigationLink{
                                            //                                            TestView(selectedItem: item)
                                            //                                        }label: {
                                            //
                                            //                                        }
                                            
                                            //                                    NavigationLink(destination: TestView(selectedItem: selectedItem!)){
                                            //                                        Image(systemName: "chevron.right")
                                            //                                            .foregroundColor(.white)
                                            //                                    }
                                        }
                                        Text(item.writing)
                                        
                                        //                                {
                                        ////                                    ViewWriting(selectedItem: selectedItem)
                                        //                                }
                                    }
                                }.frame(maxWidth: .infinity)
                                .padding()
                                .background(LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.15, green: 0.16, blue: 0.44), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0.11, green: 0.11, blue: 0.16), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 1, y: 0.95),
                                    endPoint: UnitPoint(x: 0, y: 0.05)
                                ))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .inset(by: 0.5)
                                        .stroke(.black, lineWidth: 1)
                                )
                                //                    .onDelete(perform: deleteItems)
                                //                    .sheet(isPresented: $viewModalUp) {
                                //                        ViewWriting(selectedItem: selectedItem!)
                                //                    }
//                                                        .background(LinearGradient(
//                                                            stops: [
//                                                                Gradient.Stop(color: Color(red: 0.15, green: 0.16, blue: 0.44), location: 0.00),
//                                                                Gradient.Stop(color: Color(red: 0.11, green: 0.11, blue: 0.16), location: 1.00),
//                                                            ],
//                                                            startPoint: UnitPoint(x: 1, y: 0.95),
//                                                            endPoint: UnitPoint(x: 0, y: 0.05)
//                                                        ))
                            }.onDelete(perform: deleteItems(offsets:))
                        }
                        .listStyle(.plain)
                    }
                        Button(action: {
                            modalUp.toggle()
                        }, label: {
                            Image("MainButton")
                        })
                    }
                    
                }.sheet(isPresented: $modalUp, content: {
                    MusicSelectView(modalUp: $modalUp, typingText: $typingText, selectedItemId: $selectedItemId).presentationDragIndicator(.visible)
                        .environment(\.modelContext, context)
                })
                .padding()
            }
            
        }
    }
    
    
    

