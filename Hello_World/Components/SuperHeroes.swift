//
//  SuperHeroes.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import SwiftUI

struct SuperHeroes: View {
    @EnvironmentObject var data: ModelData
    @State private var showFavoritesOnly = false // variable de estado, el estado siempre debe ser private
    
    var filteredSuperHeroes: [SuperHero] {
        data.superHeroes.filter { superHero in
            !showFavoritesOnly || superHero.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) { // usamos el prefijo $ para acceder a un enlace a una variable de estado, o una de  sus propiedades
                    
                }
                ForEach(filteredSuperHeroes) { superhero in
                    NavigationLink {
                        SuperHeroDetail(superHero: superhero)
                    } label: {
                        SuperHeroRow(superHero: superhero)
                    }
                }
            }
        }
    }
}

struct SuperHeroes_Previews: PreviewProvider {
    static private var modelData = ModelData()
    static var previews: some View {
        SuperHeroes()
            .environmentObject(modelData)
    }
}
