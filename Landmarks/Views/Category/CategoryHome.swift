//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/12.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map({ FeatureCard(landmark: $0) }))
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost().environmentObject(modelData)
            })
            .listStyle(.inset)
        }
    }
}

#Preview {
    CategoryHome()
        .environmentObject(ModelData())
}
