//
//  SongList.swift
//  Dance Off
//
//  Created by Balya Elfata on 25/05/24.
//

import SwiftUI

struct SongList: Identifiable, Hashable {
    var id = UUID()
    var fileName: String
    var category: String
    var difficulty: String
    var songName: String
    
//    init(id: UUID = UUID(), fileName: String, role: String, rarity: String, imageName: String) {
//        self.fileName = fileName
//        self.role = role
//        self.category = category
//        self.difficulty = difficulty
//        self.songName = songName
//    }
    
    static func getSongData() -> [SongList] {
        return [
            SongList(fileName: "spongebob", category: "meme", difficulty: "easy", songName: "Spongebob JellyFish Dance"),
            SongList(fileName: "gangnam_style", category: "meme", difficulty: "easy", songName: "Gangnam Style"),
            SongList(fileName: "harlem_shake", category: "meme", difficulty: "easy", songName: "Harlem Shake"),
            SongList(fileName: "watch_me", category: "meme", difficulty: "easy", songName: "Watch Me"),
            SongList(fileName: "caramelldansen", category: "meme", difficulty: "easy", songName: "Caramelldansen"),
            SongList(fileName: "permission_to_dance", category: "meme", difficulty: "easy", songName: "Permission To Dance"),
        ]
    }
}
