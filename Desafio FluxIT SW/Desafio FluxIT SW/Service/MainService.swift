//
//  MainService.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 11/08/2021.
//

import Foundation
import Alamofire

final class MainService  {
    
    func callData(success: @escaping (Films, Bool)->Void){
        let URL = "https://swapi.dev/api/films/"
        AF.request(URL).responseJSON {(result) in
            switch result.result{
            case .success:
                if let data = result.data{
                    let decoder = JSONDecoder()
                    do{
                        let values = try decoder.decode(Films.self, from: data)
                        success(values, false)
                    }catch{
                        success(Films.init(films:[]), true)
                        print("parsing fail")
                    }
                }
            case .failure:
                success(Films.init(films: []).self, true)
                print("service fail")
            }
        }
    }
    
    
    func callDataByURL(URL : String, success: @escaping (Character, Bool)->Void){
        let URL = URL
        AF.request(URL).responseJSON {(result) in
            switch result.result{
            case .success:
                if let data = result.data{
                    let decoder = JSONDecoder()
                    do{
                        let values = try decoder.decode(Character.self, from: data)
                        success(values, false)
                    }catch{
                        success(Character(name: "", gender: ""), true)
                        print("parsing fail")
                    }
                }
            case .failure:
                success(Character(name: "", gender: ""), true)
                print("service fail")
            }
        }
    }
}
