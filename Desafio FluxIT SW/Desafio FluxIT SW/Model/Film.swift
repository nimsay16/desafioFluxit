//
//  Film.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 11/08/2021.
//

import Foundation

struct Film : Decodable{
    let title : String
    let director : String
    let producer : String
    let characters : [String]
    let opening : String
    let planets : [String]
    let vehicles : [String]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case director = "director"
        case producer = "producer"
        case characters = "characters"
        case opening = "opening_crawl"
        case planets = "planets"
        case vehicles = "vehicles"
    }
}

struct Films : Decodable{
    let films : [Film]
    enum CodingKeys: String, CodingKey{
        case films = "results"
    }
}

