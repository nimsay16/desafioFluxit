//
//  Character.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 11/08/2021.
//

import Foundation

struct Character: Decodable {
    let name : String
    let gender : String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case gender = "gender"
    }
    
}
