//import SwiftUI
//import AVFoundation
//
//struct CameraView: UIViewRepresentable {
//    class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
//        var parent: CameraView
//        var detectionHandler: (CIImage) -> Void
//
//        init(parent: CameraView, detectionHandler: @escaping (CIImage) -> Void) {
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
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView(frame: .zero)
//
//        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
//        previewLayer.videoGravity = .resizeAspectFill
//        previewLayer.frame = view.bounds
//
//        view.layer.addSublayer(previewLayer)
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        if let previewLayer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
//            previewLayer.frame = uiView.bounds
//        }
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(parent: self, detectionHandler: detectionHandler)
//    }
//}
