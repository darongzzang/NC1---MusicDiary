//
//  Song.swift
//  NC1-test
//
//  Created by 김이예은 on 4/18/24.
//

import Foundation

struct Song: Codable, Identifiable, Hashable {
    var id = UUID()
    var albumCoverImage: String
    var title: String
    var artist: String
    var albumInfoURL: String
    var albumName: String
    var star: Bool
}

var dummySongs: [Song] = generateDummyData()

func generateDummyData() -> [Song] {
    let dummyData: [Song] = [
        Song(albumCoverImage: "ai to highball", title: "偽愛とハイボール", artist: "LET ME KNOW", albumInfoURL: "https://music.apple.com/kr/album/%E5%81%BD%E6%84%9B%E3%81%A8%E3%83%8F%E3%82%A4%E3%83%9C%E3%83%BC%E3%83%AB-single/1736428403", albumName: "偽愛とハイボール - Single", star: false),
        
        Song(albumCoverImage: "No Blueberries", title: "No Blueberries (Feat. DPR LIVE, CL)", artist: "DPR IAN", albumInfoURL: "https://music.apple.com/kr/album/no-blueberries-feat-dpr-live-cl-single/1543916738", albumName: "No Blueberries (Feat. DPR LIVE, CL) - Single", star: false),
        
        Song(albumCoverImage: "조심스러운 이유, 티라미수케익", title: "조심스러운 이유", artist: "김성철", albumInfoURL: "https://music.apple.com/kr/album/to-jenny-original-soundtrack-pt-1-ep/1410707504", albumName: "투제니(Original Soundtrack), Pt.1 - EP", star: false),
        
        Song(albumCoverImage: "곰인형", title: "곰인형", artist: "린", albumInfoURL: "https://music.apple.com/kr/album/lovefiction/1265819725", albumName: "LoveFiction", star: false),
        
        Song(albumCoverImage: "move-flameoflove", title: "Flame of Love (Korean Version) [Bonus Track]", artist: "태민", albumInfoURL: "https://music.apple.com/kr/album/move-the-2nd-album/1296637194", albumName: "MOVE - The 2nd Album", star: false),
        
        Song(albumCoverImage: "move-flameoflove", title: "MOVE", artist: "태민", albumInfoURL: "https://music.apple.com/kr/album/move-the-2nd-album/1296637194", albumName: "MOVE - The 2nd Album", star: false),
        
        Song(albumCoverImage: "드뷔시달빛", title: "드뷔시 - 달빛", artist: "멜로디 스튜디오", albumInfoURL: "https://music.apple.com/kr/album/%EB%93%9C%EB%B7%94%EC%8B%9C-%EB%8B%AC%EB%B9%9B-single/1558060707", albumName: "드뷔시 - 달빛 - Single", star: false),
        
        Song(albumCoverImage: "조심스러운 이유, 티라미수케익", title: "티라미수 케익", artist: "김성철", albumInfoURL: "https://music.apple.com/kr/album/to-jenny-original-soundtrack-pt-1-ep/1410707504", albumName: "투제니(Original Soundtrack), Pt.1 - EP", star: false),
        
        Song(albumCoverImage: "2stepper", title: "2 Stepper", artist: "Lace", albumInfoURL: "https://music.apple.com/kr/album/2-stepper-single/1690794383", albumName: "2 Stepper - Single", star: false),
        
        Song(albumCoverImage: "magnetic", title: "Magnetic", artist: "아일릿", albumInfoURL: "https://music.apple.com/kr/album/super-real-me-ep/1734500886", albumName: "SUPER REAL ME - EP", star: false),
        
        Song(albumCoverImage: "smart", title: "Smart", artist: "르세라핌", albumInfoURL: "https://music.apple.com/kr/album/easy-ep/1728928730", albumName: "EASY - EP", star: false),
        
        Song(albumCoverImage: "날바라바라봐", title: "날 바라바라봐", artist: "TWICE", albumInfoURL: "https://music.apple.com/kr/album/twicetagram/1303321512", albumName: "twicetagram", star: false),
        
        Song(albumCoverImage: "shinunoga", title: "Shinunoga E-Wa", artist: "Fujii Kaze", albumInfoURL: "https://music.apple.com/kr/album/help-ever-hurt-never/1505498769", albumName: "HELP EVER HURT NEVER", star: false),
        
        Song(albumCoverImage: "guilty", title: "Guilty", artist: "태민", albumInfoURL: "https://music.apple.com/kr/album/guilty-the-4th-mini-album-ep/1713694332", albumName: "Guilty - The 4th Mini Album - EP", star: false),
        
        Song(albumCoverImage: "서울의잠못이루는밤", title: "서울의 잠 못 이루는 밤 (feat.이수현)", artist: "10CM", albumInfoURL: "https://music.apple.com/kr/album/5-2-feat-lee-suhyun-single/1566979910", albumName: "5.2 (feat.이수현) - Single", star: false),
        
        Song(albumCoverImage: "beautiful", title: "Beautiful", artist: "크러쉬", albumInfoURL: "https://music.apple.com/kr/album/guardian-pt-4-original-television-soundtrack-single/1569280564", albumName: "도깨비, Pt.4 (Original Television SoundTrack) - Single", star: false),
        
        Song(albumCoverImage: "sugarcoat", title: "Sugarcoat (NATTY Solo)", artist: "KISS OF LIFE", albumInfoURL: "https://music.apple.com/kr/album/kiss-of-life-ep/1694699906", albumName: "KISS OF LIFE - EP", star: false),
        
        Song(albumCoverImage: "Polaroid Love", title: "Polaroid Love", artist: "엔하이픈", albumInfoURL: "https://music.apple.com/kr/album/dimension-answer/1600819216", albumName: "DIMENSION : ANSWER", star: false),
        
        Song(albumCoverImage: "summer", title: "Summer", artist: "The Volunteers", albumInfoURL: "https://music.apple.com/kr/album/the-volunteers/1569294418", albumName: "The Volunteers", star: false),
        
        Song(albumCoverImage: "가리워진길", title: "가리워진 길", artist: "유재하", albumInfoURL: "https://music.apple.com/kr/album/%EC%82%AC%EB%9E%91%ED%95%98%EA%B8%B0-%EB%95%8C%EB%AC%B8%EC%97%90/1528476086", albumName: "사랑하기 때문에", star: false)
    ]
    return dummyData
}

