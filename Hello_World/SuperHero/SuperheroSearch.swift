//
//  SuperheroSearch.swift
//  Hello_World
//
//  Created by Enrique SFranco on 17/06/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearch: View {
    @State var superheroName: String = ""
    @State var listOfSuperheroes: ApiNetwork.ApiContract? = nil
    @State var loading: Bool = false
    
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
                        loading = true
                        Task {
                            do {
                                listOfSuperheroes = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                            }catch {
                                print("Error")
                            }
                            loading = false
                        }
                    }
            } else {
                // Fallback on earlier versions
            }
            if loading { ProgressView().tint(.white) }
            NavigationStack {
                List(listOfSuperheroes?.results ?? []) { superhero in
                    NavigationLink(destination: SuperHeroItemDetail(superhero: superhero)) {
                        SuperHeroItem(superhero: superhero)
                    }
                }
                .listStyle(.plain) // eliminamos el fondo del list
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundApp"))
    }
}

struct SuperHeroItemDetail: View {
    let superhero: ApiNetwork.SuperHero
    
    var body: some View {
        VStack {
            Text(superhero.name)
        }
        .navigationTitle(superhero.name)
    }
}

struct SuperHeroItem: View {
    let superhero: ApiNetwork.SuperHero
    
    var body: some View {
        ZStack {
            WebImage(url: URL(string: superhero.image.url))
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
