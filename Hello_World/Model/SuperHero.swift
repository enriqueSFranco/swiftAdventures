//
//  SuperHero.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/09/23.
//

import Foundation

struct SuperHero: Codable, Identifiable {
    var id: Int
    var name: String
    var powers: [String]
    var secretIdentity: String
    var imageName: String
    var description: String
}


// Codable <- facilita el movimiento de datos entre la estructura y un archivo de datos.
