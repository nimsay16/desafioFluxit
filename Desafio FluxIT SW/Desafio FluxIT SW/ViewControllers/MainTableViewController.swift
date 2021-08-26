//
//  MainTableViewController.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 22/08/2021.
//

import UIKit

protocol MainPresenterViewProtocol : AnyObject{
    func reloadTableViewData()
}

class MainTableViewController: UITableViewController {

    var presenter : MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MainPresenter(view: self)
        presenter?.callFilms()
        tableView.register(UINib(nibName: "FilmTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmTableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getFilms().count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmTableViewCell", for: indexPath)
        if let cell = cell as? FilmTableViewCell{
            if let film = presenter?.getFilms()[indexPath.row], let characters = presenter?.getCharacter(){
                cell.setUpCell(film: film, characters: characters)
                cell.characterCollectionView.reloadData()
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
extension MainTableViewController : MainPresenterViewProtocol{
    func reloadTableViewData(){
        tableView.reloadData()
    }
}
