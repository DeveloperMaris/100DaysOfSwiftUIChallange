//
//  Mission.swift
//  Moonshot
//
//  Created by Maris Lagzdins on 25/04/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    // Nested Struct!
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String

    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        if let launchDate = launchDate {
//            let formatter = DateFormatter()
//            formatter.dateStyle = .long
//            return formatter.string(from: launchDate)
            return DateFormatter.localizedString(from: launchDate, dateStyle: .long, timeStyle: .none)
        } else {
            return "N/A"
        }
    }
}
