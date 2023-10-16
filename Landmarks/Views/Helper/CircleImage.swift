//
//  CircleImage.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/06.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(content: {
                Circle().stroke(.white, lineWidth: 4)
            })
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
