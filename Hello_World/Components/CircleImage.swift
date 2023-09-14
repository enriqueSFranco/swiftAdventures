//
//  CircleImage.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

struct CircleImage: View {
    var nameImage: String
    
    var body: some View {
        VStack {
            Image(nameImage)
                .resizable()
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
            Text(nameImage)
                .fontWeight(.bold)
                .textCase(.uppercase)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(nameImage: "spiderman")
    }
}
