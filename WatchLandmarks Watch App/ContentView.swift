//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by yanadoo on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
