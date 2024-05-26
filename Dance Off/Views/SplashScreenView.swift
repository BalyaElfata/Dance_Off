//
//  SplashScreenView.swift
//  Dance Off
//
//  Created by Balya Elfata on 26/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State var SplashScreenStarted = false
    @State var SplashScreenEnded = false
    @State var isRotating = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !SplashScreenEnded {
                    splashScreenContent
                } else {
                    HomeView()
                        .transition(.identity) // Apply fade transition
                        .navigationBarBackButtonHidden(true)
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 3)) {
                    isRotating.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut(duration: 1)) {
                        SplashScreenStarted.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation(.easeInOut(duration: 1)) {
                        SplashScreenEnded.toggle()
                    }
                }
            }
        }
    }
    
    var splashScreenContent: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color(hex: 0xF2BB05, opacity: 0.8)
                .ignoresSafeArea()
            
            Circle()
                .frame(height: 600)
                .foregroundColor(Color(hex: 0x000000, opacity: 0.1))
                .scaleEffect(SplashScreenStarted ? 0 : 1.4)
            Circle()
                .frame(height: 600)
                .foregroundColor(Color(hex: 0x000000, opacity: 0.1))
                .scaleEffect(SplashScreenStarted ? 0 : 1.8)
            Circle()
                .frame(height: 600)
                .foregroundColor(Color(hex: 0x000000, opacity: 0.1))
                .scaleEffect(SplashScreenStarted ? 0 : 2.2)
            
            VStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: 600, height: 600)
                    .shadow(color: Color(red: 0.13, green: 0.05, blue: 0.27).opacity(0.3), radius: 15, x: 0, y: 0)
                    .rotationEffect(isRotating ? .zero : .degrees(-360))
                    .scaleEffect(SplashScreenStarted ? 0 : 1)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
