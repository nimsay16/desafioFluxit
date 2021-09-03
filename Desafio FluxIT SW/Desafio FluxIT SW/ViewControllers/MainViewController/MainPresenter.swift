//
//  MainPresenter.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 22/08/2021.
//

import Foundation

protocol MainPresenterProtocol {
    func callFilms()
    func getFilms() -> [Film]
    func getCharacter() -> [Character]
}

final class MainPresenter {
    
    weak var view : MainPresenterViewProtocol?
    var films : [Film] = []
    var characters : [Character] = []
    
    init(view: MainPresenterViewProtocol) {
        self.view = view
    }
    
}
extension MainPresenter : MainPresenterProtocol{
    
    func getFilms() -> [Film]{ films }
    func getCharacter() -> [Character] {characters}
    
    func callFilms(){
        let service = MainService()
        service.callData { [weak self] (result, error) in
            self?.films = result.films
            if let films = self?.films{
                for f in films{
                    for character in f.characters{
                        self?.callCharacter(url : character)
                    }
                }
            }
        }
    }
    
    func callCharacter(url : String){
        let service = MainService()
        service.callDataByURL(URL: url) { [weak self] (result, error) in
            if !error{
                self?.characters.append(result)
                self?.view?.reloadTableViewData()
            }else{
                print("error")
            }
        }
        
    }
}
