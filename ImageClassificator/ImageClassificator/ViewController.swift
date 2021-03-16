//
//  ViewController.swift
//  ImageClassificator
//
//  Created by Chantal Deguire on 2021-03-16.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classifyImageButton: UIButton!
    
    //MARK: - Variables
    private var inputImage: UIImage?
    private var classification: String?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        imageView.contentMode = .scaleAspectFill
        imageView.image  = UIImage.placeholder
    }
    
    //MARK: - IBActions
    
    @IBAction func selectButtonPressed(_ sender: Any) {
        getPhoto()
    }
    @IBAction func cameraButtonPressed(_ sender: Any) {
        getPhoto(cameraSource: true)
    }
    
    @IBAction func classifyImageButtonPressed(_ sender: Any) {
        classifyImage()
    }
    
    //MARK: - Class Functions
    
    private func refresh() {
        if inputImage == nil {
            classLabel.text = "Pick or take a Photo!"
            imageView.image = UIImage.placeholder
        } else {
            imageView.image = inputImage
            
            if classification == nil {
                classLabel.text = "None"
                classifyImageButton.enable()
            } else {
                classLabel.text = classification
                classifyImageButton.disable()
            }
        }
    }
    
    private func classifyImage() {
        classification = "FRUIT!"
        
        refresh()
    }
}

//MARK: - EXTENSIONS

extension ViewController: UINavigationControllerDelegate, UIPickerViewDelegate, UIImagePickerControllerDelegate {
    
    private func getPhoto(cameraSource: Bool = false) {
        let photoSource: UIImagePickerController.SourceType
        photoSource = cameraSource ? .camera : .photoLibrary
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = photoSource
        imagePicker.mediaTypes = [kUTTypeImage as String]
        present(imagePicker, animated: true)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        inputImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        classification = nil
        
        picker.dismiss(animated: true)
        refresh()
        
        if inputImage == nil {
            summonAlertView(message: "Image was malformed.")
        }
    }
    
    private func summonAlertView(message: String? = nil) {
        let alertController = UIAlertController(
            title: "Error",
            message: message ?? "Action could not be completed.",
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(
                                    title: "OK",
                                    style: .default))
        present(alertController, animated: true)
    }
}
