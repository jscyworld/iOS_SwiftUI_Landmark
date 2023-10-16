//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Sirius Kim on 2023/10/16.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            Divider()
            Text(message ?? "You're within 5 miles of one of your favorite landmarks.")
        }
        .lineLimit(0)
    }
}

//#Preview {
//    NotificationView()
//}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock", message: "You're within 5 miles of Turtle Rock.", landmark: ModelData().landmarks[0])
        }
    }
}
