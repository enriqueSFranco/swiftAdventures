//
//  ModelData.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import Foundation

var dataSuperHeroes: [SuperHero] = load("superHeroes.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

// Codeable fue diseñado para proporcionar un mecanismo potente para convertir JSON a struct
