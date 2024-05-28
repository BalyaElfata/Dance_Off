//import SwiftUI
//import Vision
//import AVKit
//import Combine
//
//struct PreparationView: View {
//    
//    @ObservedObject var predictionVM = PredictionViewModel()
//    
////    @State var totalScore: Double = 0
//    
//    // timer
//    @State var counter: Int = 3
//    @State var timerActive = false
//    @State private var cancellable: AnyCancellable? = nil
//    
//    var song: String? // selected song
//
//    let songs = SongList.getSongData() // song data
//    
//    var body: some View {
//        ZStack {
//            Image("background")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//                .opacity(0.3)
//            Color(hex: 0xF2BB05, opacity: 0.8)
//                .ignoresSafeArea()
//            VStack {
//                Text("\(predictionVM.predicted)")
//                    .font(Font.custom("Samurai Blast", size: 40))
//                    .foregroundStyle(.purple)
//                
//                Text("Confidence: \(predictionVM.confidence)")
//                    .font(Font.custom("Samurai Blast", size: 40))
//                    .foregroundStyle(.blue)
//                
////                Text("Score: \(totalScore)")
////                    .font(Font.custom("Samurai Blast", size: 40))
////                    .foregroundStyle(.blue)
////                    .onChange(of: predictionVM.score) {
////                        totalScore += predictionVM.score ?? 0
////                    }
//                
//                HStack {
//                    // Video Player
//                    ZStack {
//                        Rectangle()
//                            .frame(width: 405, height: 720)
//                            .foregroundColor(.blue)
//                            .shadow(radius: 8)
//                            .onAppear {
//                                //code
//                            }
//                            .onDisappear {
//                                //code
//                            }
//                        if predictionVM.predicted == "Starting.." || predictionVM.predicted == "No Person Detected" {
//                            Text("Please wait a moment.")
//                                .font(.largeTitle)
//                                .onAppear{
//                                    timerActive = false
//                                    cancellable?.cancel()
//                                    cancellable = nil
//                                }
//                        } else {
//                            Text("\(counter)")
//                                .font(.largeTitle)
//                                .onAppear {
//                                    // Start the timer
//                                    timerActive = true
//                                    cancellable = Timer.publish(every: 1, on: .main, in: .common)
//                                        .autoconnect()
//                                        .sink { _ in
//                                            counter -= 1
//                                        }
//                                    if counter == 0 {
//                                        GameView()
//                                    }
//                                }
//                        }
//                    }
//                    // Camera View
////                    Image("logo")
//                    Image(uiImage: predictionVM.currentFrame ?? UIImage())
//                        .resizable()
//                        .frame(width: 405, height: 720)
//                        .shadow(radius: 8)
//                }
//                .padding(20)
//            }
//        }
//        .onReceive(
//            NotificationCenter
//                .default
//                .publisher(for: UIDevice.orientationDidChangeNotification)
//        ) { _ in
//            predictionVM.videoCapture.updateDeviceOrientation()
//        }
//    }
//    
//    private func danceScore(_ score: Double?) -> [Double]? {
//        var totalScore: [Double]
//        totalScore = []
//        totalScore.append(score ?? 0)
//        return totalScore
//    }
//}
//
//struct PreparationView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreparationView()
//    }
//}
