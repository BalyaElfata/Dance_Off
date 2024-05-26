import SwiftUI

struct SongView: View {
    
    var song: SongList

    var body: some View {
        ZStack {
//            Rectangle()
//                .fill(Color.white)
//                .frame(width: 720, height: 200)
//                .cornerRadius(40)
//                .shadow(radius: 8)
            HStack() {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .padding(.trailing, 40)
                Text(song.songName)
                    .foregroundColor(Color(hex: 0xF0F0C9, opacity: 1))
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
//                }
            }
            .background(Color(hex: 0x935FA7, opacity: 1))
            .frame(width: 720, height: 200)
            .cornerRadius(40)
            .shadow(radius: 16)
        }
//        VStack(spacing: 10) {
//            switch song.category {
//            case "k-pop":
//                Text(song.name)
//            case "meme":
//                Text(song.name)
//            default:
//                Text(song.name)
//            }
//            ZStack {
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: 121, height: 34)
//                    .cornerRadius(20)
//                HStack{
//                    switch song.difficulty {
//                    case "easy":
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.orange)
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.orange)
//                    case "medium":
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.orange)
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.orange)
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.orange)
//                    case "hard":
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.purple)
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.purple)
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.purple)
//                    default:
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.orange)
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    SongView(song: SongList(fileName: "spongebob", category: "meme", difficulty: "medium", songName: "Permission To Dance"))
}
