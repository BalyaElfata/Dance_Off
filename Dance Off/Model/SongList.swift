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
    
    static func getSongData() -> [SongList] {
        return [
            SongList(fileName: "spongebob", category: "meme", difficulty: "hard", songName: "Spongebob Dance"),
            SongList(fileName: "gangnam_style", category: "meme", difficulty: "easy", songName: "Gangnam Style"),
            SongList(fileName: "harlem_shake", category: "meme", difficulty: "easy", songName: "Harlem Shake"),
            SongList(fileName: "watch_me", category: "meme", difficulty: "easy", songName: "Watch Me"),
            SongList(fileName: "caramelldansen", category: "meme", difficulty: "medium", songName: "Caramelldansen"),
            SongList(fileName: "permission_to_dance", category: "dance", difficulty: "hard", songName: "Permission To Dance"),
            SongList(fileName: "bagas_dribble", category: "meme", difficulty: "easy", songName: "Bagas Dribble"),
            SongList(fileName: "what_it_is", category: "dance", difficulty: "hard", songName: "What It Is"),
            SongList(fileName: "cupid", category: "dance", difficulty: "medium", songName: "Cupid"),
            SongList(fileName: "fortune_cookie", category: "dance", difficulty: "medium", songName: "Fortune Cookie"),
            SongList(fileName: "joget_keju", category: "meme", difficulty: "easy", songName: "Joget Keju"),
            SongList(fileName: "magnetic", category: "dance", difficulty: "hard", songName: "Magnetic"),
            SongList(fileName: "signal", category: "dance", difficulty: "hard", songName: "Signal"),
            SongList(fileName: "what_is_love", category: "dance", difficulty: "hard", songName: "What is Love?"),
        ]
    }
}
