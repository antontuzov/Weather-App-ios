//
//  WeatherCollectionViewCell.swift
//  Weather App ios
//
//  Created by turbo on 09.03.2021.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    static let identifier = "WeatherCollectionViewCell"

        static func nib() -> UINib {
            return UINib(nibName: "WeatherCollectionViewCell",
                         bundle: nil)
        }
    
    
    
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!

    
    
    func configure(with model: HourlyWeatherEntry) {
           self.tempLabel.text = "\(model.temperature)"
           self.iconImageView.contentMode = .scaleAspectFit
           self.iconImageView.image = UIImage(named: "clear")
       }

       override func awakeFromNib() {
           super.awakeFromNib()
       }

}
