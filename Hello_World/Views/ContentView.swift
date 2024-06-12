//
//  ContentView.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

// Custom Container
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { colum in
                        content(row, colum)
                    }
                }
            }
        }
    }
    
}

// view protocol (contenido y diseño de la vista)
struct ContentView: View {
   
    var body: some View {
        Exercise1()
//        SuperHeroes()
//        StacksViews()
        /*GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }*/
    }
}

// vista previa para la vista ContentView
#Preview {
    ContentView()
}
/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}*/
