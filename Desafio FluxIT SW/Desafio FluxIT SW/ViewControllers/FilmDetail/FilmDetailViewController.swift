//
//  FilmDetailViewController.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 01/09/2021.
//

import UIKit

protocol FilmDetailViewProtocol : AnyObject{
    func tableViewReloadData()
}

class FilmDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var planetsVehiclesTableView: UITableView!
    
    var presenter : FilmDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        presenter?.callPlanets()
        setTable()
    }
    
    func setLabels(){
        titleLabel.text = presenter?.getTitle() ?? ""
        directorLabel.text = "Director: \(presenter?.getDirector() ?? "")"
        producerLabel.text = "Producer: \(presenter?.getProducer() ?? "")"
    }
    
    func setTable(){
        planetsVehiclesTableView.delegate = self
        planetsVehiclesTableView.dataSource = self
        planetsVehiclesTableView.register(UINib(nibName: "PlanetsTableViewCell", bundle: nil), forCellReuseIdentifier: "PlanetsTableViewCell")
        planetsVehiclesTableView.register(UINib(nibName: "VehiclesTableViewCell", bundle: nil), forCellReuseIdentifier: "VehiclesTableViewCell")
    }

}
extension FilmDetailViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.getDataPlanetsVehicles()?.numberOfItems.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.getDataPlanetsVehicles()?.numberOfItems[section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch indexPath.section {
        case 0:
            cell = createPlanetCell(tableView, cellForRowAt: indexPath)
        case 1:
            cell = createVehicleCell(tableView, cellForRowAt: indexPath)
        default:
            cell = createVehicleCell(tableView, cellForRowAt: indexPath)
        }
        return cell
    }
    func createPlanetCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetsTableViewCell", for: indexPath)
        if let cell = cell as? PlanetsTableViewCell ,let planet = presenter?.getDataPlanetsVehicles()?.planets[indexPath.row]{
            cell.setUp(planet: planet)
        }
        return cell
    }
    func createVehicleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehiclesTableViewCell", for: indexPath)
        if let cell = cell as? VehiclesTableViewCell ,let vehicle = presenter?.getDataPlanetsVehicles()?.vehicles[indexPath.row]{
            cell.setUpCell(vehicle: vehicle)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        presenter?.getDataPlanetsVehicles()?.nameOfItems[section] ?? ""
    }
    
    
}
extension FilmDetailViewController : FilmDetailViewProtocol{
    func tableViewReloadData(){
        planetsVehiclesTableView.reloadData()
    }
}

