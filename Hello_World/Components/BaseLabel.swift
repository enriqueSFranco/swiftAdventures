//
//  BaseLabel.swift
//  Hello_World
//
//  Created by Enrique SFranco on 12/06/24.
//

import SwiftUI

struct BaseLabel: View {
    var body: some View {
        Label("badminton", systemImage: "figure.badminton")
        Label(
            title: {Text("show alerts")},
            icon: {Image(systemName: "bell")}
        )
    }
}

#Preview {
    BaseLabel()
}
