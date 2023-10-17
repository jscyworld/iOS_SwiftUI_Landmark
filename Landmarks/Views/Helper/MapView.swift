//
//  MapView.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/06.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    enum Zoom: String, CaseIterable, Identifiable {
        var id: Zoom {
            return self
        }
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
    }
    
    @AppStorage("Mapview.zoom")
    private var zoom: Zoom = .medium
    
    var delta: CLLocationDegrees {
        switch zoom {
            case .near:
                return 0.02
            case .medium:
                return 0.2
            case .far:
                return 2
        }
    }
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
