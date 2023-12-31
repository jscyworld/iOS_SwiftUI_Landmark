//
//  ModelData.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/06.
//

import Foundation

@Observable
class ModelData: ObservableObject {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue })
    }
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured }
    }
    var profile = Profile.default
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Can find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("can not load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("can not parse \(filename) as \(T.self):\n\(error)")
    }
}
