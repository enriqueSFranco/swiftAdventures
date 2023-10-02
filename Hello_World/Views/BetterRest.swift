//
//  BetterRest.swift
//  Hello_World
//
//  Created by Enrique SFranco on 02/10/23.
//

import SwiftUI

struct BetterRest: View {
    @State private var sleepAmount = 8.0
    var body: some View {
        Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 1...12, step: 2)
    }
}

struct BetterRest_Previews: PreviewProvider {
    static var previews: some View {
        BetterRest()
    }
}
