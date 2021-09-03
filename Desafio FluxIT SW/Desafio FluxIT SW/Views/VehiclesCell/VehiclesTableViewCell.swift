//
//  VehiclesTableViewCell.swift
//  Desafio FluxIT SW
//
//  Created by Yasmin Casco on 03/09/2021.
//

import UIKit

class VehiclesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var passangerLabel: UILabel!
    @IBOutlet weak var vehicleClassLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(vehicle : Vehicle){
        nameLabel.text = "Name: \(vehicle.name)"
        modelLabel.text = "Model: \(vehicle.model)"
        passangerLabel.text = "Passangers: \(vehicle.passangers)"
        vehicleClassLabel.text = "Class: \(vehicle.vehicleClass)"
    }

}
