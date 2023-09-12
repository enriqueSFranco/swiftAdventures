//
//  SuperHeroes.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

struct SuperHeroes: View {
    var body: some View {
        NavigationView {
            List (dataSuperHeroes, id: \.name) { superhero in
                NavigationLink {
                    SuperHeroDetail(superHero: superhero)
                } label: {
                    SuperHeroRow(superHero: superhero)
                }
            }
        }
        .navigationTitle("DC Comics")
    }
}

struct SuperHeroes_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroes()
    }
}
