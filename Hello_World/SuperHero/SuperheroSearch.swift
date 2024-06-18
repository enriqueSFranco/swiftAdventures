//
//  SuperheroSearch.swift
//  Hello_World
//
//  Created by Enrique SFranco on 17/06/24.
//

import SwiftUI

struct SuperheroSearch: View {
    @State var superheroName: String = ""
    
    var body: some View {
        VStack {
            if #available(iOS 17.0, *) {
                TextField("", text: $superheroName, prompt: Text("Batman, Superman, ...").foregroundStyle(.gray))
                    .foregroundColor(.white)
                    .padding(16)
                    .border(Color.purple, width: 1.5)
                    .padding(8)
                    .autocorrectionDisabled()
                    .onSubmit {
                        print("buscaste: \(superheroName)")
                    }
            } else {
                // Fallback on earlier versions
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundApp"))
    }
}

#Preview {
    SuperheroSearch()
}
