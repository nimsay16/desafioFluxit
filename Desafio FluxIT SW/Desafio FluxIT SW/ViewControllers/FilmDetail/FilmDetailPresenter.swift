//
//  FilmDetailPresenter.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 01/09/2021.
//

import Foundation

struct PlanetsVehicles{
    var planets : [Planet]
    var vehicles: [Vehicle]
    var numberOfItems : [Int]
    var nameOfItems : [String]
}

protocol FilmDetailPresenterProtocol{
    func getTitle() -> String
    func getDirector() -> String
    func getProducer() -> String
    func callPlanets()
    func getDataPlanetsVehicles() -> PlanetsVehicles?
}

final class FilmDetailPresenter {
    
    weak var view : FilmDetailViewProtocol?
    var film : Film?
    var planets : [Planet] = []
    var vehicles : [Vehicle] = []
    var planetsAndVehicles : PlanetsVehicles?
    
    init(view: FilmDetailViewProtocol, film : Film) {
        self.view = view
        self.film = film
    }
    
}
extension FilmDetailPresenter : FilmDetailPresenterProtocol{
    func getTitle() -> String{
        return film?.title ?? ""
    }
    func getDirector() -> String{
        return film?.director ?? ""
    }
    func getProducer() -> String{
        return film?.producer ?? "" 
    }
    
    func callPlanets(){
        let service = MainService()
        for urlPlanet in film?.planets ?? []{
            service.callDataPlanets(URL: urlPlanet) { [weak self] (result, error) in
                if !error{
                    if let result = result{
                        self?.planets.append(result)
                        print(result.name)
                        self?.callVehicles()
                    }
                }
            }
        }
    }
    func callVehicles(){
        let service = MainService()
        for urlVehicle in film?.vehicles ?? []{
            service.callDataVehicles(URL: urlVehicle) { [weak self] (result, error) in
                if !error{
                    if let result = result{
                        self?.vehicles.append(result)
                        print(result.name)
                        self?.setDataPlanetsVehicles()
                    }
                }
            }
        }
    }
    
    func setDataPlanetsVehicles(){
        planetsAndVehicles =  PlanetsVehicles(planets: planets, vehicles: vehicles, numberOfItems: [planets.count,vehicles.count], nameOfItems: ["Planets", "Vehicles"])
        view?.tableViewReloadData()
        view?.stopAnimation()
    }
    
    func getDataPlanetsVehicles() -> PlanetsVehicles?{
        return planetsAndVehicles
    }
}
