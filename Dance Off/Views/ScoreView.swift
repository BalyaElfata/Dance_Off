//
//  ScoreView.swift
//  Dance Off
//
//  Created by Balya Elfata on 22/05/24.
//

import SwiftUI

struct ScoreView: View {
    @Binding var totalScore: Double
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color(hex: 0xF2BB05, opacity: 0.8)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: 0xB594B6, opacity: 1))
                        .frame(width: 440, height: 280)
                        .cornerRadius(40)
                        .shadow(radius: 8)
                    VStack {
                        HStack{
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                                .foregroundColor(Color(hex: 0xD74E09, opacity: 1))
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                                .foregroundColor(Color(hex: 0xD74E09, opacity: 1))
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                                .foregroundColor(Color(hex: 0xD74E09, opacity: 1))
                        }
                        .padding()
                        Text("Score: 80")
                            .font(Font.custom("Samurai Blast", size: 60))
//                            .foregroundColor(Color(hex: 0x24272B, opacity: 1))
                    }
                }
                // Back Button to Song Selection View
                NavigationLink (destination: SongSelectionView()) {
                    Image(systemName: "arrowshape.backward.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        .background(
                            Rectangle()
                                .fill(Color(hex: 0x935FA7, opacity: 0.8))
                                .frame(width: 160, height: 80)
                                .cornerRadius(20)
                                .shadow(radius: 4)
                        )
                        .padding(.top, 80)
                }
            }
        }
    }
}

#Preview {
    ScoreView()
}
