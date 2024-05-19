import SwiftUI
import AVKit

struct PlayVideo: View {
    @State private var showSidebar = true
    
    let videos = ["video","video2","video3","video4","video5"]
    
    var body: some View {
        let avPlayer = AVPlayer(url:  Bundle.main.url(forResource: videos[Int.random(in: videos.indices)], withExtension: "mp4")!)
        
        ZStack{
            Color(.orange)
            NavigationSplitView {
                if showSidebar {
                    ZStack{
                        Color(.orange)
                            .ignoresSafeArea()
                        Circle()
                            .foregroundColor(.blue)
                            .frame(width: 300)
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                showSidebar = false
                            }
                        }
                    }
                }
            } detail: {
                VideoPlayer(player: avPlayer)
                    .frame(height: 500)
                    .onAppear {
                        avPlayer.play()
                        avPlayer.isMuted = true
                    }
                    .onDisappear {
                        // play your turn
                    }
            }
        }

//        VideoPlayer(player: avPlayer)
//            .frame(height: 500)
//            .onAppear {
//                avPlayer.play()
//                avPlayer.isMuted = true
//            }
//            .onDisappear {
//                /// play your turn
//            }
    }
}

#Preview {
    PlayVideo()
}
