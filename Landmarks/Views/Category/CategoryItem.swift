//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/12.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading, content: {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .clipShape(Path(roundedRect: CGRect(x: 0, y: 0, width: 155, height: 155), cornerRadius: 5))
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        })
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
