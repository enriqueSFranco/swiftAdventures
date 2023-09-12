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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack(alignment: .leading) { // <- flex-colum, grid-colum-1
                Text("Enrique")
                    .font(.title) // <- modificadores
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                HStack() { // <- flex-row
                    Text("Joshua Tree National Park")
                    Spacer() // <- justify-betwen
                    Text("California")
                }
            }
        }
        .padding()
    }
}

// vista previa para la vista ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
