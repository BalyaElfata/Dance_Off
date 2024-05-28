import SwiftUI

struct SongView: View {
    
    var song: SongList

    var body: some View {
        ZStack {
            HStack() {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(.trailing, 40)
                Text(song.songName)
                    .foregroundColor(Color(hex: 0xF0F0C9, opacity: 1))
                    .font(Font.custom("Cherry Bomb One", size: 30))
                Spacer()
                    switch song.difficulty {
                    case "easy":
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star")
                                .foregroundColor(.orange)
                            Image(systemName: "star")
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 40)
                    case "medium":
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star")
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 40)
                    case "hard":
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 40)
                    default:
                        HStack {
                            Image(systemName: "star")
                                .foregroundColor(.orange)
                            Image(systemName: "star")
                                .foregroundColor(.orange)
                            Image(systemName: "star")
                                .foregroundColor(.orange)
                        }
                        .padding(.trailing, 40)
                    }
            }
            .background(Color(hex: 0x935FA7, opacity: 1))
            .frame(width: 720, height: 200)
            .cornerRadius(40)
            .shadow(radius: 16)
        }
    }
}

#Preview {
    SongView(song: SongList(fileName: "spongebob", category: "meme", difficulty: "medium", songName: "Permission To Dance"))
}
