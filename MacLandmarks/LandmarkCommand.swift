//
//  LandmarkCommand.swift
//  Landmarks
//
//  Created by Sirius Kim on 10/17/23.
//

import SwiftUI

struct LandmarkCommand: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands()
        
        CommandMenu("Landmark") {
            Button("\(selectedLandmark?.isFavorite == true ? "Remove": "Marks") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get {
            self[SelectedLandmarkKey.self]
        }
        set {
            self[SelectedLandmarkKey.self] = newValue
        }
    }
}