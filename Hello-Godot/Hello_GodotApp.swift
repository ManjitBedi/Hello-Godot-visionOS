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
let VOLUME_SIZE = simd_double3(1.8, 1.0, 1.5)


@main
struct Hello_GodotApp: App {
    var body: some Scene {
        WindowGroup("Menu", id: "Menu") {
            ContentView()
        }
        .windowStyle(.volumetric)

        WindowGroup("Godot", id: "Godot") {
            GodotContentView()
        }
        .defaultSize(width: VOLUME_SIZE.x, height: VOLUME_SIZE.y, depth: VOLUME_SIZE.z, in: .meters)
        .windowStyle(.volumetric)
    }
}
