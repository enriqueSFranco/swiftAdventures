//
//  SuperheroSearch.swift
//  Hello_World
//
//  Created by Enrique SFranco on 17/06/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct SuperheroSearch: View {
    @State var superheroName: String = ""
    @State var listOfSuperheroes: ApiNetwork.ApiContract? = nil
    
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
                        // creamos una Task para ejecutar procesos asincronos
                        Task {
                            do {
                                listOfSuperheroes = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                            }catch {
                                print("Error")
                            }
                        }
                    }
            } else {
                // Fallback on earlier versions
            }
            List(listOfSuperheroes?.results ?? []) { superhero in
                SuperHeroItem(superhero: superhero)
            }
            .listStyle(.plain) // eliminamos el fondo del list
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundApp"))
    }
}

struct SuperHeroItem:View {
    let superhero: ApiNetwork.SuperHero
    
    var body: some View {
        ZStack {
            WebImage(url: ULR(string: superhero.image))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack {
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.1))
            }
        }
        .frame(height: 200)
        .cornerRadius(10)
        .listRowBackground(Color("BackgroundApp"))
    }
}

#Preview {
    SuperheroSearch()
}
