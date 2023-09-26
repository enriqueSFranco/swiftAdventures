//
//  Button.swift
//  Hello_World
//
//  Created by Enrique SFranco on 20/09/23.
//

import SwiftUI

struct StateButton: View {
    @State private var count = 0
    
    var body: some View {
        Button("Total count: \(count)") {
            count += 1
        }
    }
}

struct StateButton_Previews: PreviewProvider {
    static var previews: some View {
        StateButton()
    }
}
