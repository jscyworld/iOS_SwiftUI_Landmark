//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/10.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toogle Favorite", systemImage: isSet ? "star.fill": "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
