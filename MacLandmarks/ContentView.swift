//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Sirius Kim on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
