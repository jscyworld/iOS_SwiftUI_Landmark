//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/06.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width:50, height: 50)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0)))
            VStack(alignment: .leading, content: {
                Text(landmark.name)
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                #endif
            })
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill").foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
