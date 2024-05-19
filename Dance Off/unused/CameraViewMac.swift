//import SwiftUI
//import AVFoundation
//
//struct CameraViewMac: NSViewRepresentable {
//    class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
//        var parent: CameraViewMac
//        var detectionHandler: (CIImage) -> Void
//
//        init(parent: CameraViewMac, detectionHandler: @escaping (CIImage) -> Void) {
//            self.parent = parent
//            self.detectionHandler = detectionHandler
//        }
//
//        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//            guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
//            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
//            detectionHandler(ciImage)
//        }
//    }
//
//    let session: AVCaptureSession
//    let detectionHandler: (CIImage) -> Void
//
//    func makeNSView(context: Context) -> NSView {
//        let view = NSView(frame: .zero)
//
//        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
//        previewLayer.videoGravity = .resizeAspectFill
//
//        let layerView = NSView()
//        layerView.wantsLayer = true
//        layerView.layer = previewLayer
//
//        view.addSubview(layerView)
//
//        // Auto-layout constraints
//        layerView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            layerView.topAnchor.constraint(equalTo: view.topAnchor),
//            layerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            layerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            layerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//
//        return view
//    }
//
//    func updateNSView(_ nsView: NSView, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self, detectionHandler: detectionHandler)
//    }
//}
