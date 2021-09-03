//
//  PlanetsTableViewCell.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 01/09/2021.
//

import UIKit

class PlanetsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var popultionLabel: UILabel!
    
    @IBOutlet weak var climateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(planet : Planet){
        nameLabel.text = "Name: \(planet.name)"
        popultionLabel.text = "Population: \(planet.population)"
        climateLabel.text = "Climate: \(planet.climate)"
    }

}
