//
//  WeatherTableViewCell.swift
//  Weather App ios
//
//  Created by turbo on 08.03.2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "WeatherTableViewCell"
    
    static func nib() -> UINib {
       
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    
    
    
    
    
    
    
    
    
    
}
