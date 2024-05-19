//import Foundation
//import CoreML
//import Vision
//
//@available(iOS 14.0, *)
//class Predictor {
//    /// Fitness classifier model.
//    let fitnessClassifier = FitnessClassifier()
//    
//    /// Vision body pose request.
//    let humanBodyPoseRequest = VNDetectHumanBodyPoseRequest()
//    
//    /// A rotation window to save the last 60 poses from past 2 seconds.
//    var posesWindow: [VNRecognizedPointsObservation?] = []
//    init() {
//        posesWindow.reserveCapacity(predictionWindowSize)
//    }
//    
//    /// Extracts poses from a frame.
//    func processFrame(_ samplebuffer: CMSampleBuffer) throws -> [VNRecognizedPointsObservation] {
//        // Perform Vision body pose request
//        let framePoses = extractPoses(from: samplebuffer)
//
//        // Select the most promiment person.
//        let pose = try selectMostProminentPerson(from: framePoses)
//
//        // Add the pose to window
//        posesWindow.append(pose)
//
//        return framePoses
//    }
//
//    // Make a prediction when window is full, periodically
//    var isReadyToMakePrediction: Bool {
//        posesWindow.count == predictionWindowSize
//    }
//
//    /// Make a model prediction on a window.
//    func makePrediction() throws -> PredictionOutput {
//        // Prepare model input: convert each pose to a multi-array, and concatenate multi-arrays.
//        let poseMultiArrays: [MLMultiArray] = try posesWindow.map { person in
//            guard let person = person else {
//                // Pad 0s when no person detected.
//                return zeroPaddedMultiArray()
//            }
//            return try person.keypointsMultiArray()
//        }
//        
//        let modelInput = MLMultiArray(concatenating: poseMultiArrays, axis: 0, dataType: .float)
//
//        // Perform prediction
//        let predictions = try fitnessClassifier.prediction(poses: modelInput)
//
//        // Reset poses window
//        posesWindow.removeFirst(predictionInterval)
//
//        return (
//            label: predictions.label,
//            confidence: predictions.labelProbabilities[predictions.label]!
//        )
//    }
//}
