//
//  ScoreView.swift
//  Dance Off
//
//  Created by Balya Elfata on 22/05/24.
//

import SwiftUI

struct ScoreView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color(hex: 0xF1F17C, opacity: 0.8)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 440, height: 280)
                        .cornerRadius(40)
                        .shadow(radius: 8)
                    VStack {
                        HStack{
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                                .foregroundColor(.yellow)
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                                .foregroundColor(.yellow)
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width:50, height: 50)
                                .foregroundColor(.yellow)
                        }
                        .padding()
                        Text("Score: 80")
                            .font(Font.custom("Samurai Blast", size: 60))
                            .foregroundColor(Color(hex: 0x24272B, opacity: 1))
                    }
                }
                Image(systemName: "arrowshape.backward.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .background(
                        Rectangle()
                            .fill(Color(hex: 0xB594B6, opacity: 0.8))
                            .frame(width: 160, height: 80)
                            .cornerRadius(20)
                            .shadow(radius: 4)
                    )
                    .padding(.top, 80)
            }
        }
    }
}

#Preview {
    ScoreView()
}
