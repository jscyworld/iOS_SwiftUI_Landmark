//
//  Landmark.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/06.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    struct Coordinates: Codable, Hashable {
        var latitude: Double
        var longitude: Double
    }
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    var isFavorite: Bool
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    var category: Category
    
    var isFeatured: Bool
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}
