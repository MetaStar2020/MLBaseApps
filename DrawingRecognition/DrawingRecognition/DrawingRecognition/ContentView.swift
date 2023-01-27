//
//  ContentView.swift
//  DrawingRecognition
//
//  Created by Chantal Deguire on 2023-01-06.
//

import SwiftUI
import Vision

struct ContentView: View {
    @State private var imagePickerOpen: Bool = false
    @State private var cameraOpen: Bool = false
    @State private var image: UIImage? = nil
    @State private var classification: String? = nil
    
    private let placeholderImage = UIImage(named: "placeholder")!
    private let classifier = DrawingClassifierModel()
    
    private var cameraEnabled: Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    private var classificationEnabled: Bool {
        image != nil && classification == nil
    }
    
    private func classify() {
        print("Analysing drawing...")
        classifier.classify(self.image) { result in
            self.classification = result?.icon
        }
    }
    
    private func controlReturned(image: UIImage?) {
        print("Image return \(image == nil ? "failure" : "success")...")
        
        //turn image right side up, resize it and turn it black-and-white
        self.image = classifier.configure(image: image)
    }
    
    private func summonImagePicker() {
        print("Summoning ImagePicker...")
        imagePickerOpen = true
    }
    
    private func summonCamera() {
        print("Summoning camera...")
        cameraOpen = true
    }
    
    var body: some View {
        if imagePickerOpen { return imagePickerView() }
        if cameraOpen { return cameraView() }
        return mainView()
    }
}

extension ContentView {
    private func mainView() -> AnyView {
        return AnyView(NavigationView {
            MainView(
                image: image ?? placeholderImage,
                text: "\(classification ?? "Nothing dectected")") {
                    TwoStateButton(
                        text: "Classify",
                        disabled: !classificationEnabled, action: classify
                    )
            }
            .padding()
            .navigationBarTitle(
                Text("Drawing Recognition"),
                displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: summonImagePicker) {
                    Text("Select")
                },
                trailing: Button(action: summonCamera) {
                    Image(systemName: "camera")
                }.disabled(!cameraEnabled)
            )
        })
    }
    
    private func imagePickerView() -> AnyView {
        return AnyView(ImagePicker { result in
            self.classification = nil
            self.controlReturned(image: result)
            self.imagePickerOpen = false
        })
    }
    
    private func cameraView() -> AnyView {
        return AnyView(ImagePicker(camera: true) { result in
            self.classification = nil
            self.controlReturned(image: result)
            self.cameraOpen = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
