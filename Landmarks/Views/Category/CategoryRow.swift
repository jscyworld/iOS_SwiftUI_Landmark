//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/12.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
//    var landmarks = ModelData().landmarks
    CategoryRow(
        categoryName: ModelData().landmarks[0].category.rawValue,
        items: Array(ModelData().landmarks.prefix(3))
    )
}

//struct CategoryRow_Previes: PreviewProvider {
//    static var landmarks = ModelData().landmarks
//    
//    static var previews: some View {
//        CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
//    }
//}
