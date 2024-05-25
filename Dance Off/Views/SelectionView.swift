//
//  SelectionView.swift
//  Dance Off
//
//  Created by Balya Elfata on 25/05/24.
//

import SwiftUI

struct SelectionView: View {
    var songs = SongList.getSongData()
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color(hex: 0xF1F17C, opacity: 0.8)
                .ignoresSafeArea()
            VStack {
                Text("Song List")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ScrollView(.vertical) {
                    LazyVStack(spacing: 25) {
                        ForEach(songs.indices, id: \.self) { index in
                            let song = songs[index]
                            NavigationLink (destination: GameView(song: song.fileName)) {
                                SongView(song: song)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SelectionView()
}
