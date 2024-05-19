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
            Text("Prediction: \(predictionVM.predicted)")
            Text("Score: \(predictionVM.confidence)")
            Spacer()
        }
    }
    
    let avPlayer = AVPlayer(url:  Bundle.main.url(forResource: "video", withExtension: "mp4")!)
    
    var body: some View {
        HStack {
            VideoPlayer(player: avPlayer)
                .frame(width: 500)
                .onAppear {
                    avPlayer.play()
                    avPlayer.isMuted = true
                }
            ZStack {
                Image(uiImage: predictionVM.currentFrame ?? UIImage())
                    .resizable()
                    .scaledToFill()
                
                predictionLabels
            }
        }
        .padding()
        .onAppear{
            predictionVM.updateUILabels(with: .startingPrediction)
        }
        // Detect if device change orientation
        .onReceive(
            NotificationCenter
                .default
                .publisher(for: UIDevice.orientationDidChangeNotification)) {
                    _ in
                    predictionVM.videoCapture.updateDeviceOrientation()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
