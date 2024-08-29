//
//  Hello_GodotApp.swift
//  Hello-Godot
//
//  Created by Manjit Bedi on 2024-08-24.
//

import SwiftUI

// visionOS will silently clamp to volume size if set above or below limits
// max for all dimensions is 1.98
// min for all dimensions is 0.24
let defaultSize = Size3D(width: 1.4, height: 1.0, depth: 0.6)

@main
struct Hello_GodotApp: App {
    var body: some Scene {
        WindowGroup("Menu", id: "Menu") {
            ContentView()
        }
        .defaultSize(defaultSize, in: .meters)
        .windowStyle(.volumetric)

        // The Godot volume gets placed adjacent to the existing volume for the Menu window group.
        WindowGroup("Godot", id: "Godot") {
            GodotContentView()
        }
        .defaultSize(defaultSize, in: .meters)
        .windowStyle(.volumetric)
        .defaultWindowPlacement { content, context in
            if let new = context.windows.first(where: { $0.id == "Menu" }) {
                return WindowPlacement(.trailing(new))
            } else {
                return WindowPlacement(.none)
            }
        }
    }
}
