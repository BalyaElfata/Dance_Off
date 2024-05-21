//
//  ContentView.swift
//  Action Classifier SwiftUI
//
//  Created by Gianluca Orpello on 02/03/23.
//

import SwiftUI
import Vision
import AVKit

struct MLView: View {
    
    @ObservedObject var predictionVM = PredictionViewModel()
    
    @State private var avPlayer: AVPlayer?
    @State private var currentVideoIndex = 0
    
    @State var total: Double = 0
    
    let videos = ["video2", "video3", "video4", "video5"]
    
    var switchCamera: some View {
        HStack {
            Button {
                predictionVM.videoCapture.toggleCameraSelection()
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.camera.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            .padding(.leading)
            
            Spacer()
        }
    }
    
    var predictionLabels: some View {
        VStack {
            switchCamera
            Spacer()
        }
    }
    
    var body: some View {
        ZStack {
//            Image()
            VStack {
                Text("\(predictionVM.predicted)")
                    .font(Font.custom("Samurai Blast", size: 40))
                    .foregroundStyle(.purple)
                
                
                Text("Confidence: \(predictionVM.confidence)")
                    .font(Font.custom("Samurai Blast", size: 40))
                    .foregroundStyle(.blue)
                
                Text("Score: \(total)")
                    .font(Font.custom("Samurai Blast", size: 40))
                    .foregroundStyle(.blue)
                    .onChange(of: predictionVM.score) {
                        total += predictionVM.score ?? 0
                    }
                
                HStack {
                    // Video Player
                    if let player = avPlayer {
                        VideoPlayer(player: player)
                            .frame(width: 405, height: 720)
                            .border(Color.orange, width: 5)
                            .onAppear {
                                player.play()
                                player.isMuted = true
                            }
                    } else {
                        Text("Loading video...")
                    }
                    
                    // Camera View
                    Image(uiImage: predictionVM.currentFrame ?? UIImage())
                        .resizable()
                        .frame(width: 405, height: 720)
                    //                    .scaledToFill()
                        .border(Color.blue, width: 5)
                }
                .padding(20)
            }
        }
        
        .onAppear {
            playNextVideo()
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
    
    private func playNextVideo() {
        guard !videos.isEmpty else { return }
        
        let videoName = videos[currentVideoIndex]
        
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            avPlayer = AVPlayer(url: url)
            
            let playerItem = AVPlayerItem(url: url)
            avPlayer?.replaceCurrentItem(with: playerItem)
            avPlayer?.play()
            
            NotificationCenter.default.addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: playerItem,
                queue: .main
            ) { [self] _ in
                self.videoDidFinishPlaying()
            }
        } else {
            print("Error: Video file \(videoName) not found")
        }
    }
    
    private func videoDidFinishPlaying() {
        currentVideoIndex = (currentVideoIndex + 1) % videos.count
        playNextVideo()
    }
    
    private func danceScore(_ score: Double?) -> [Double]? {
        var totalScore: [Double]
        totalScore = []
        totalScore.append(score ?? 0)
        return totalScore
    }

}

struct MLView_Previews: PreviewProvider {
    static var previews: some View {
        MLView()
    }
}
