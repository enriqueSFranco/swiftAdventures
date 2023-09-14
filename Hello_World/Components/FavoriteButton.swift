//
//  ButtonLike.swift
//  Hello_World
//
//  Created by Enrique SFranco on 14/09/23.
//

import SwiftUI

//Debido a que utilizamos un enlace, los cambios realizados dentro de esta vista se propagan de nuevo a la fuente de datos

struct FavoriteButton: View {
    @Binding var isSet: Bool // enlace que indica el estado actual del botón
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
