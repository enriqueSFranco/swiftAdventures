//
//  BindingStateToUserInterfaceControls.swift
//  Hello_World
//
//  Created by Enrique SFranco on 20/09/23.
//

import SwiftUI

struct BindingStateToUserInterfaceControls: View {
    @State private var name = ""
//    El poner el binding $ nos permite modificar: $name
//    Cuando no usamos el binding solo podemos leer la información
    var body: some View {
        Form {
            TextField("Enter your name", text: $name) // enlace bidireccional
            Text("Your name is \(name)")
        }
    }
}

struct BindingStateToUserInterfaceControls_Previews: PreviewProvider {
    static var previews: some View {
        BindingStateToUserInterfaceControls()
    }
}
