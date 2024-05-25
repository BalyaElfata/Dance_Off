//import SwiftUI
//import AVFoundation
//import CoreML
//import Vision
//
//struct GameView1: View {
//    @State private var session = AVCaptureSession()
//    @State private var detectionResults = [VNRecognizedObjectObservation]()
//
//    var body: some View {
//        VStack {
//            CameraView(session: session, detectionHandler: detectObjects)
//                .frame(height: 400)
////                .overlay(
////                    DetectionOverlay(detections: detectionResults, viewSize: CGSize(width: 400, height: 400))
////                )
//                .onAppear {
//                    checkCameraPermission()
//                }
//        }
//    }
//
//    func checkCameraPermission() {
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//        case .authorized:
//            setupCamera()
//        case .notDetermined:
//            AVCaptureDevice.requestAccess(for: .video) { granted in
//                if granted {
//                    setupCamera()
//                } else {
//                    print("Camera access denied")
//                }
//            }
//        default:
//            print("Camera access denied")
//        }
//    }
//
//    func setupCamera() {
//        session.beginConfiguration()
//
//        guard let videoDevice = AVCaptureDevice.default(for: .video),
//              let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
//              session.canAddInput(videoDeviceInput) else {
//            print("Failed to set up camera input")
//            return
//        }
//
//        session.addInput(videoDeviceInput)
//
//        let videoOutput = AVCaptureVideoDataOutput()
//        let coordinator = CameraView.Coordinator(parent: CameraView(session: session, detectionHandler: detectObjects), detectionHandler: detectObjects)
//        videoOutput.setSampleBufferDelegate(coordinator, queue: DispatchQueue(label: "videoQueue"))
//
//        guard session.canAddOutput(videoOutput) else {
//            print("Failed to set up camera output")
//            return
//        }
//
//        session.addOutput(videoOutput)
//        session.commitConfiguration()
//        session.startRunning()
//    }
//
//    func detectObjects(ciImage: CIImage) {
//        guard let model = try? VNCoreMLModel(for: dance1().model) else {
//            print("Error loading model")
//            return
//        }
//
//        let request = VNCoreMLRequest(model: model) { request, error in
//            if let results = request.results as? [VNRecognizedObjectObservation] {
//                DispatchQueue.main.async {
//                    self.detectionResults = results
//                }
//            } else {
//                if let error = error {
//                    print("Detection error: \(error.localizedDescription)")
//                } else {
//                    print("No results found.")
//                }
//            }
//        }
//
//        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
//
//        DispatchQueue.global(qos: .userInitiated).async {
//            do {
//                try handler.perform([request])
//            } catch {
//                print("Failed to perform detection: \(error.localizedDescription)")
//            }
//        }
//    }
//}
//
//struct DetectionOverlay: View {
//    var detections: [VNRecognizedObjectObservation]
//    var viewSize: CGSize
//
//    var body: some View {
//        GeometryReader { geometry in
//            ForEach(detections, id: \.uuid) { detection in
//                let boundingBox = detection.boundingBox
//                let rect = CGRect(
//                    x: boundingBox.minX * geometry.size.width,
//                    y: (1 - boundingBox.maxY) * geometry.size.height,
//                    width: boundingBox.width * geometry.size.width,
//                    height: boundingBox.height * geometry.size.height
//                )
//
//                Rectangle()
//                    .path(in: rect)
//                    .stroke(Color.red, lineWidth: 2)
//                    .overlay(
//                        Text(detection.labels.first?.identifier ?? "")
//                            .background(Color.red.opacity(0.7))
//                            .foregroundColor(.white)
//                            .padding(4)
//                            .position(x: rect.midX, y: rect.minY)
//                    )
//            }
//        }
//    }
//}
//
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
