import SwiftUI
import AVFoundation

struct HomeView: View {
    @State var isTapped = false
    @State var isScaled = false
    @Environment(\.backgroundMaterial) var backgroundMaterial
    
    var body: some View {
        NavigationStack {
            // background
            ZStack {
                Color(hex: 0xF1F17C, opacity: 1)
                    .ignoresSafeArea()
                Circle()
                    .frame(minHeight: 1350)
                    .foregroundColor(Color(hex: 0xECEC46, opacity: 1))
                Circle()
                    .frame(height: 1100)
                    .foregroundColor(Color(hex: 0xDEDE17, opacity: 1))
                Circle()
                    .frame(height: 850)
                    .foregroundColor(Color(hex: 0xCBCB15, opacity: 1))
                VStack (alignment: .center){
                    //Camera Button
                    NavigationLink (destination: MLView()) {
                        Image("logo")
                            .resizable()
                            .frame(width: 600, height: 600)
                            .shadow(color: Color(red: 0.13, green: 0.05, blue: 0.27).opacity(0.3), radius: 15, x: 0, y: 0)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                                                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                                                Sounds.playSound(sound: "coin3", type: "wav")
                    })
                }
            }
        }
//         Play Music
        .onAppear() {
            Sounds.playMusic(music: "bgMusic", type: "mp3")
        }
    }
}

#Preview {
    HomeView()
}
