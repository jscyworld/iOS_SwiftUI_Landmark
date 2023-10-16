//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Sirius Kim on 2023/10/13.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text(profile.username)
                    .font(.title)
                    .bold()
                Text("Notification: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Completed Badges")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.50)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                    
                })
                
                Divider()
                
                VStack(alignment: .leading, content: {
                    Text("Recent Hike")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                })
            })
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environmentObject(ModelData())
}
