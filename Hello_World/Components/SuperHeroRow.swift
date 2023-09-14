//
//  SuperHeroRow.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

struct SuperHeroRow: View {
    var superHero: SuperHero // <- propiedad almacenada
    
    var body: some View {
        HStack {
            Image("\(superHero.imageName)")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
            VStack (alignment: .leading) {
                Text("\(superHero.name)")
                Text("\(superHero.secretIdentity)")
                Text("Powers: \(superHero.powers.joined(separator: ","))")
                if superHero.isFavorite { // incluimos un punto de vista condicional
                    Image(systemName: "star.fill")
                }
            }
        }
    }
}

struct SuperHeroRow_Previews: PreviewProvider {
    static var data = ModelData().superHeroes
    static var previews: some View {
        Group {
            SuperHeroRow(superHero: data[0])
            SuperHeroRow(superHero: data[1])
        }
        .previewLayout(.fixed(width: 300, height: 200))
    }
}
