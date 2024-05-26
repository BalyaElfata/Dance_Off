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
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
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
