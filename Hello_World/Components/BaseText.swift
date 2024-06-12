//
//  BaseText.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/06/24.
//

import SwiftUI

struct BaseText: View {
    var body: some View {
        VStack {
            Text("hello world")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Text("Custom")
                .font(.system(
                    size: 40,
                    weight: .light,
                    design: .monospaced
                ))
                .italic()
                .underline()
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    BaseText()
}
