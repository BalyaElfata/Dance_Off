import SwiftUI
import Vision
import AVKit

struct GameView: View {
    
    @ObservedObject var predictionVM = PredictionViewModel()
    
    @State private var avPlayer: AVPlayer? // video player
    
    @State var totalScore: Double = 0
    @State var scoreCounter: Int = 0
    
    var song: String?
    
    let songs = SongList.getSongData()
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.3)
            Color(hex: 0xF2BB05, opacity: 0.8)
                .ignoresSafeArea()
            VStack {
//                Text("\(predictionVM.predicted)")
//                    .font(Font.custom("Samurai Blast", size: 40))
//                    .foregroundStyle(.purple)
//
//                Text("Confidence: \(predictionVM.confidence)")
//                    .font(Font.custom("Samurai Blast", size: 40))
//                    .foregroundStyle(.blue)
                
//                if scoreCounter > 0 {
                Text("Score")
                    .font(Font.custom("Cherry Bomb One", size: 40))
                    .foregroundColor(.purple)
                Text("\(totalScore/Double(scoreCounter))")
                    .font(Font.custom("Cherry Bomb One", size: 40))
                    .foregroundColor(.purple)
                    .onChange(of: predictionVM.score) {
                        if predictionVM.score! > 0 {
                            totalScore += predictionVM.score!
                            scoreCounter += 1
                        }
                    }
//                }
                
                HStack {
                    // Video Player
                    if predictionVM.predicted == "Starting.." || predictionVM.predicted == "No Person Detected" {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                            Text("Loading video...")
                        }
                        .frame(width: 405, height: 720)
                        .shadow(radius: 8)
                    } else {
                        if let player = avPlayer {
                            VideoPlayer(player: player)
                                .frame(width: 405, height: 720)
                                .shadow(radius: 8)
                                .onAppear {
                                    player.play()
                                }
                                .onDisappear {
                                    player.pause()
                                }
                        }
                    }
                    
                    // Camera View
                    Image(uiImage: predictionVM.currentFrame ?? UIImage())
                        .resizable()
                        .frame(width: 405, height: 720)
                        .shadow(radius: 8)
                }
                .padding(20)
            }
        }
        
        .onAppear {
            loadVideo()
            predictionVM.updateUILabels(with: .startingPrediction)
        }
        .onReceive(
            NotificationCenter
                .default
                .publisher(for: UIDevice.orientationDidChangeNotification)
        ) { _ in
            predictionVM.videoCapture.updateDeviceOrientation()
        }
    }
    
    private func loadVideo() {
            guard let song = song else {
                print("Error: No song specified")
                return
            }
            
            if let url = Bundle.main.url(forResource: song, withExtension: "mp4") {
                avPlayer = AVPlayer(url: url)
            } else {
                print("Error: Video file \(song) not found")
            }
    }
    
    private func danceScore(_ score: Double?) -> [Double]? {
        var totalScore: [Double]
        totalScore = []
        totalScore.append(score ?? 0)
        return totalScore
    }

}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
