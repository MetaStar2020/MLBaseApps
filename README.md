# MLBaseApps


![Swift Version](https://img.shields.io/badge/Swift-5.0-F16D39.svg?style=flat)
![Build Status](https://travis-ci.org/dwyl/learn-travis.svg?branch=master)
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
![GitHub repo size](https://img.shields.io/github/repo-size/MetaStar2020/MLBaseApps)
![GitHub contributors](https://img.shields.io/github/contributors/MetaStar2020/MLBaseApps)
![GitHub stars](https://img.shields.io/github/stars/MetaStar2020/MLBaseApps?style=social)
![GitHub forks](https://img.shields.io/github/forks/MetaStar2020/MLBaseApps?style=social)

MLBaseApps is a folder containing multiple AI/MachineLearning SWIFT mini-apps.

<p align="row">
<img src= "https://media.giphy.com/media/AfWPNvhvugHJ5AwxlJ/giphy.gif" width="200" >
<img src= "https://media.giphy.com/media/n1tB1sprRQ46kV7RVJ/giphy.gif" width="200" >
<img src= "https://media.giphy.com/media/BGjhivDVBR5kWIcq0S/giphy.gif" width="200" >
  
</p>

## Motivation

The purpose of this folder is to demonstrate my abilities as an mobile app developer/engineer in AI and Machine Learning using Swift CoreML.

Areas of focus: <strong> VISION, CoreML, SWIFTUI, UIViewControllerRepresentable (importing storyboard-related UI) </strong>

Architecture: <strong> Model-View-Controller (MVC) </strong>

## 1. Face Detection

This app uses image analysistechniques to count faces in an image and perform various actions with that information, such as applying other images on top of the face, with the correct rotation. 

### Features

- [x] SWIFTUI
- [x] VNFaceObservation (CoreML VISION) <i> - Recognizing face or facial features in an image </i>
- [x] Taking control of UIImage to do advanced modifications 

## 2. Barcode Detection & Saliency Detection
<img src= "https://user-images.githubusercontent.com/61833549/110999096-dab5cc80-834d-11eb-94bb-82b7c61ab48b.png" width="200" >

This app/playground uses Apple's frameworks to find barcodes in images and generate a heatmap of an image that can be used to highlight areas of interest.

### Features

- [x] VNRectangleObservation and VNBarcodeObservation (CoreML VISION)  <i> - Recognizing rectangles and barcodes in an image </i>
- [x] VNSaliencyImageObservation (CoreML VISION) <i> - Recognizing the area of interest in an image </i>
- [x] Manipulating the standard CGRect class

## 3. Image Similarity Detection

This SWIFTUI app uses Apple's frameworks to find similarities between two images selected by the user.

### Features

- [x] SWIFTUI
- [x] VNFeaturePrintObservation (CoreML VISION) <i> - Assists in deriving image similarity </i>
- [x] Taking control of UIImage to do advanced modifications 

## 4. Image Classification Recognition

This iOS app classifies an image using my own deep-learning machine-learning model. Dataset is an MIT licensed dataset provided at http://bit.ly/2oF5qXt

### Features

- [x] DataSet (images)
- [x] CreateML (mlmodel) 

## Requirements

• iOS 13.2+

• XCode 12+

## 4. Drawing Recognition

This iOS app classifies an image that was drawn by user using my own deep-learning machine-learning model. Dataset is an MIT licensed dataset provided at http://bit.ly/2Ba4o8M

### Features

- [x] DataSet (images)
- [x] CreateML (mlmodel) 
- [x] TuriCreate (mlmodel)
- [x] Python for TuriCreate

## Requirements

• iOS 13.2+

• XCode 12+

## Contributing to MLBaseApps
<!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
To contribute to any apps under MLBaseApps, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin <project_name>/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Contributors

Become the first contributor by contributing to this project! See <strong>Contributing to any apps under MLBaseApps</strong> above for more information. 

## Contact

If you want to contact me you can reach me at <5s5onscreen@gmail.com>.

## License
<!--- If you're not sure which open license to use see https://choosealicense.com/--->

This project uses the following license: [MIT License](<https://choosealicense.com/licenses/mit/>).
