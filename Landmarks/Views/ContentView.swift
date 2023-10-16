//
//  ContentView.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView (
            selection: $selection,
            content:  {
                CategoryHome().tabItem { Label("Featured", systemImage: "star") }.tag(Tab.featured)
                LandmarkList().tabItem { Label("List", systemImage: "list.bullet") }.tag(Tab.list)
            }
        )
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

