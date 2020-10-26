//
//  Views.swift
//  FaceDetector
//
//  Created by Chantal Deguire on 2020-10-26.
//  Copyright © 2020 5S5. All rights reserved.
//

import SwiftUI

struct TwoStateButton: View {
    private let text: String
    private let disabled: Bool
    private let background: Color
    private let action: () -> Void
    
    init(text: String, disabled: Bool, background: Color = .blue, action: @escaping () -> Void) {
        self.text = text
        self.disabled = disabled
        self.background = disabled ? .gray : background
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                }.padding().background(background).cornerRadius(10)
        }.disabled(disabled)
    }
}

struct MainView: View {
    private let image: UIImage
    private let text: String
    private let button: TwoStateButton
    
    init(image: UIImage, text: String, button: () -> TwoStateButton) {
        self.image = image
        self.text = text
        self.button = button()
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            Text(text)
                .font(.title)
                .bold()
            Spacer()
            self.button
        }
    }
}
