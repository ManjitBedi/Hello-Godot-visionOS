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
let VOLUME_SIZE = simd_double3(0.3, 0.4, 0.4)

let defaultSize = Size3D(width: 0.6, height: 0.6, depth: 0.4)

@main
struct Hello_GodotApp: App {
    var body: some Scene {
        WindowGroup("Menu", id: "Menu") {
            ContentView()
        }
        .defaultSize(defaultSize, in: .meters)
        .windowStyle(.volumetric)

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
