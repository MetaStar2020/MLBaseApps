//
//  Faces.swift
//  FaceDetector
//
//  Created by Chantal Deguire on 2020-10-26.
//  Copyright © 2020 5S5. All rights reserved.
//

import Foundation
import UIKit
import Vision

extension UIImage {
    func detectFaces(completion: @escaping ([VNFaceObservation]?) -> ()) {
    
        guard let image = self.cgImage else { return completion(nil) }
        let request = VNDetectFaceRectanglesRequest()
        
        DispatchQueue.global().async {
            let handler = VNImageRequestHandler(cgImage: image, orientation: self.cgImageOrientation, options: [:])
            try? handler.perform([request])
        }
        
        guard let observations = request.results as? [VNFaceObservation] else {
            return completion(nil)
        }
        completion(observations)
    }
    
}

/*
extension UIImage.Orientation {
    init(_ cgOrientation: UIImage.Orientation) {
        switch cgOrientation {
            case .up: self = .up
            case .upMirrored: self = .upMirrored
            case .down: self = .down
            case .downMirrored: self = .downMirrored
            case .left: self = .left
            case .leftMirrored: self = .leftMirrored
            case .right: self = .right
            case .rightMirrored: self = .rightMirrored
        @unknown default:
            self = .up //Might have to change here?
        }
    }
}

extension CGImagePropertyOrientation {
    init(_ uiOrientation: UIImage.Orientation) {
        switch uiOrientation {
            case .up: self = .up
            case .upMirrored: self = .upMirrored
            case .down: self = .down
            case .downMirrored: self = .downMirrored
            case .left: self = .left
            case .leftMirrored: self = .leftMirrored
            case .right: self = .right
            case .rightMirrored: self = .rightMirrored
        @unknown default:
            self = .up // What else should it be?
        }
    }
}*/
