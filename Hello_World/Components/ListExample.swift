//
//  ListExample.swift
//  Hello_World
//
//  Created by Enrique SFranco on 17/06/24.
//

import SwiftUI

let pokemons = [
    Pokemon(name: "charizar"),
    Pokemon(name: "lugia"),
    Pokemon(name: "articuno"),
    Pokemon(name: "zapdos"),
    Pokemon(name: "moltres")
]

let digimons = [
    Digimon(name: "agumon"),
    Digimon(name: "agumon"),
    Digimon(name: "garurumon"),
    Digimon(name: "greymon"),
    Digimon(name: "metalgarurumon"),
    Digimon(name: "omnimon"),
    Digimon(name: "omnimon")
]

struct ListExample: View {
    var body: some View {
//        List {
//            ForEach(pokemons, id:\.name) { pokemon in
//                Text(pokemon.name)
//            }
//        }
//        List(digimons) { digimon in
//            Text(digimon.name)
//        }
        List {
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id: \.name) { pokemon in
                    /*@START_MENU_TOKEN@*/Text(pokemon.name)/*@END_MENU_TOKEN@*/
                }
            }
            Section(header: Text("Digimons")) {
                ForEach(digimons) { digimon in
                    Text(digimon.name)
                }
            }
        }
        .listStyle(.plain)
    }
}

struct Pokemon {
    let name: String
}

// si hay elementos que se repite y los vamos a usar como key debemos usar el protocolo Identifiable
struct Digimon: Identifiable {
    let id = UUID() // agregamos el id explicitamente
    let name: String
}

#Preview {
    ListExample()
}
