//
//  ContentView.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

// view protocol (contenido y diseño de la vista)
struct ContentView: View {
   
    var body: some View {
//        SuperHeroes()
        CustomForm()
    }
}

// vista previa para la vista ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
