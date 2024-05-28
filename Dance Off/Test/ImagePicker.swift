//import SwiftUI
//import AppKit
//
//struct ImagePicker: View {
//    @Binding var image: NSImage?
//    @Binding var isPresented: Bool
//    
//    var body: some View {
//        Button("Select Image") {
//            let panel = NSOpenPanel()
//            panel.allowedFileTypes = ["jpg", "png", "heic"]
//            panel.begin { response in
//                if response == .OK, let url = panel.url {
//                    if let nsImage = NSImage(contentsOf: url) {
//                        self.image = nsImage
//                    }
//                }
//                self.isPresented = false
//            }
//        }
//    }
//}
