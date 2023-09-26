//
//  Hello_WorldApp.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

@main // <- punto de entrada
struct Hello_WorldApp: App {
    
    @StateObject private var modelData = ModelData() // se inicializa una sola vez el objeto durante el tiempo de vida de la app
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData) // agregamos el objeto model data para que este disponible para cualquier subvista de content-view
        }
    }
}
