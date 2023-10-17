//
//  LandmarkSetting.swift
//  Landmarks
//
//  Created by yanadoo on 10/17/23.
//

import SwiftUI

struct LandmarkSetting: View {
    @AppStorage("Mapview.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

#Preview {
    LandmarkSetting()
}
