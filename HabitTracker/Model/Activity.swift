//
//  Activity.swift
//  HabitTracker
//
//  Created by Antonio Vega on 5/6/21.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var streak: Int = 1
    let goal: Int
}
