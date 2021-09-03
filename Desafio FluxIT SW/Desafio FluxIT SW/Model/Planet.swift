//
//  Planet.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 01/09/2021.
//

import Foundation

struct Planet: Decodable {
    let name : String
    let population : String
    let climate : String
    
    enum CodingKeys : String, CodingKey{
        case name = "name"
        case population = "population"
        case climate = "climate"
    }
}
