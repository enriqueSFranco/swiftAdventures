//
//  CircleImage.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        VStack {
            Image("Heroes")
                .resizable()
                .frame(width: 250, height: 150)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
            Text("spider man")
                .foregroundColor(.red)
                .fontWeight(.bold)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
