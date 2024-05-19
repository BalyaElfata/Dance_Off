import SwiftUI
import AVFoundation
import Vision

struct CameraView2: View {
    @StateObject private var cameraModel = CameraModel()
    
    var body: some View {
        VStack {
            CameraPreview(session: cameraModel.session)
                .onAppear {
                    cameraModel.startSession()
                }
                .onDisappear {
                    cameraModel.stopSession()
                }
            
            if let result = cameraModel.classificationResult {
                Text("Prediction: \(result.identifier)")
                Text("Confidence: \(String(format: "%.2f", result.confidence * 100))%")
            } else {
                Text("Analyzing...")
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CameraPreview: UIViewRepresentable {
    class VideoPreviewView: UIView {
        override class var layerClass: AnyClass {
            AVCaptureVideoPreviewLayer.self
        }
        
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            return layer as! AVCaptureVideoPreviewLayer
        }
    }
    
    var session: AVCaptureSession
    
    func makeUIView(context: Context) -> VideoPreviewView {
        let view = VideoPreviewView()
        view.videoPreviewLayer.session = session
        view.videoPreviewLayer.videoGravity = .resizeAspectFill
        return view
    }
    
    func updateUIView(_ uiView: VideoPreviewView, context: Context) {}
}

class CameraModel: NSObject, ObservableObject {
    private var actionClassifier: VNCoreMLModel?
    private var captureSession: AVCaptureSession?
    private var videoOutput: AVCaptureVideoDataOutput?
    
    @Published var classificationResult: VNClassificationObservation?
    
    var session: AVCaptureSession {
        return captureSession ?? AVCaptureSession()
    }
    
    override init() {
        super.init()
        setupModel()
        setupCamera()
    }
    
    private func setupModel() {
        do {
            let model = try DanceModel(configuration: MLModelConfiguration()).model
            actionClassifier = try VNCoreMLModel(for: model)
        } catch {
            print("Failed to load model: \(error.localizedDescription)")
        }
    }
    
    private func setupCamera() {
        captureSession = AVCaptureSession()
        guard let captureSession = captureSession else { return }
        
        captureSession.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!), captureSession.canAddInput(videoDeviceInput) else { return }
        captureSession.addInput(videoDeviceInput)
        
        videoOutput = AVCaptureVideoDataOutput()
        guard let videoOutput = videoOutput, captureSession.canAddOutput(videoOutput) else { return }
        captureSession.addOutput(videoOutput)
        
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.commitConfiguration()
    }
}

extension CameraModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        var requestOptions: [VNImageOption: Any] = [:]
        
        if let cameraIntrinsicData = CMGetAttachment(sampleBuffer, key: kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, attachmentModeOut: nil) {
            requestOptions = [.cameraIntrinsics: cameraIntrinsicData]
        }
        
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .right, options: requestOptions)
        
        do {
            let request = VNCoreMLRequest(model: actionClassifier!) { [weak self] request, error in
                guard let results = request.results as? [VNClassificationObservation],
                      let bestResult = results.first else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.classificationResult = bestResult
                }
            }
            try imageRequestHandler.perform([request])
        } catch {
            print("Failed to perform classification: \(error.localizedDescription)")
        }
    }
    
    func startSession() {
        captureSession?.startRunning()
    }
    
    func stopSession() {
        captureSession?.stopRunning()
    }
}
