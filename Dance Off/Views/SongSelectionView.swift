//
//  SelectionView.swift
//  Dance Off
//
//  Created by Balya Elfata on 25/05/24.
//

import SwiftUI

struct SongSelectionView: View {
    var songs = SongList.getSongData()
    var body: some View {
        ZStack {
            // Background
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color(hex: 0xF2BB05, opacity: 0.8)
                .ignoresSafeArea()
            VStack {
                // Title
                Text("Song List")
                    .font(Font.custom("Cherry Bomb One", size: 50))
                    .foregroundColor(Color(hex: 0xD74E09, opacity: 1))
                    .padding(.trailing, 40)
                
                // Scroll View for song list
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
    SongSelectionView()
}
