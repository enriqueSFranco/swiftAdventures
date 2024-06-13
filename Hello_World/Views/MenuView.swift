//
//  MenuView.swift
//  Hello_World
//
//  Created by Enrique SFranco on 12/06/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }
                
            }
        }
    }
}

#Preview {
    MenuView()
}
