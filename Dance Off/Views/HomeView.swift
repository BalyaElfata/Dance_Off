import SwiftUI
import AVFoundation

struct HomeView: View {
    @State var viewDidLoad = false
    @State var isTapped = false
    @State var isScaled = false
    @State var isRotated = false
    @Environment(\.backgroundMaterial) var backgroundMaterial
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                Color(hex: 0xF2BB05, opacity: 0.8)
                    .ignoresSafeArea()
                
                VStack (alignment: .center){
                    //Camera Button
                    NavigationLink (destination: SongSelectionView()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(hex: 0x935FA7, opacity: 1))
                                .frame(width: 400, height: 240)
                                .cornerRadius(40)
                                .shadow(color: Color(red: 0.13, green: 0.05, blue: 0.27).opacity(0.3), radius: 15, x: 0, y: 0)
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 120, height: 100)
                                .foregroundColor(.white)
                        }
                        .scaleEffect(viewDidLoad ? 1 : 0)
                    }
                }
            }
        }
        // hides back button from splash screen
        .navigationBarBackButtonHidden(true)
        
//         Play Music
        .onAppear() {
            withAnimation(.easeInOut(duration: 1)) {viewDidLoad = true}
            Sounds.playMusic(music: "bgMusic", type: "mp3")
        }
    }
}

#Preview {
    HomeView()
}
