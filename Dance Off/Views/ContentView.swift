//
//  ContentView.swift
//  Dance Off
//
//  Created by Balya Elfata on 14/05/24.
//

import SwiftUI
import CoreML
import Vision

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.custom("Samurai Blast", size: 32))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
