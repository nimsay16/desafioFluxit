//
//  CharacterCollectionViewCell.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 25/08/2021.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    func setUpCollectionCell(character : Character){
        nameLabel.text = character.name
        genderLabel.text = character.gender
    }
    
}
