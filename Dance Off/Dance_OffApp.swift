//
//  Dance_OffApp.swift
//  Dance Off
//
//  Created by Balya Elfata on 14/05/24.
//
//TO DO: overall code nya sudah bagus dibagi MVVM, tapi agak bingung waktu baca bagian Video Capture nya sama hubungan Pose, Action classifier, bagian songnya juga sudah masuk enum dan ga pakai if else, jadi runnya lebih ringan cmiiw, keren Balya

import SwiftUI

@main
struct Dance_OffApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
