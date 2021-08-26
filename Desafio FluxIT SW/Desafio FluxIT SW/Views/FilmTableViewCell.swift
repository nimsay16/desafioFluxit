//
//  FilmTableViewCell.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 22/08/2021.
//

import UIKit

class FilmTableViewCell: UITableViewCell {

    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var characterCollectionView: UICollectionView!
    
    var characters : [Character]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        characterCollectionView.delegate = self
        characterCollectionView.dataSource = self
        characterCollectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCollectionViewCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setUpCell(film: Film, characters : [Character]){
        filmTitleLabel.text = film.title
        openingLabel.text = film.opening
        self.characters = characters
    }

}
extension FilmTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath)
        if let cell = cell as? CharacterCollectionViewCell{
            if let character = characters?[indexPath.row]{
                cell.setUpCollectionCell(character: character)
            }
        }
        return cell
    }
    
    
}
