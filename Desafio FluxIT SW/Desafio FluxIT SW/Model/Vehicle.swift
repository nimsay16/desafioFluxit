//
//  Vehicle.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 01/09/2021.
//

import Foundation

struct Vehicle: Decodable {
    let name : String
    let model: String
    let passangers : String
    let vehicleClass : String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
        case passangers = "passengers"
        case vehicleClass = "vehicle_class"
    }
}
