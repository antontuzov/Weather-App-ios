//
//  WeatherTableViewCell.swift
//  Weather App ios
//
//  Created by Anton Tuzov on 08.03.2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var lowTempLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    
    

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
    
    
    func configure(with model: DailyWeatherEntry) {
        self.highTempLabel.textAlignment = .center
        self.lowTempLabel.textAlignment = .center
        self.lowTempLabel.text = "\(model.temperatureLow)°"
        self.highTempLabel.text = "\(model.temperatureHigh)°"
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.time)))
        self.iconImageView.contentMode = .scaleAspectFit
        
        
        let icon = model.icon.lowercased()
               if icon.contains("clear") {
                   self.iconImageView.image = UIImage(named: "sunny")
               }
               else if icon.contains("rain") {
                   self.iconImageView.image = UIImage(named: "cloudy")
               }
               else {
                   // cloud icon
                   self.iconImageView.image = UIImage(named: "storm")
               }

    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    func getDayForDate(_ date: Date?) -> String {
            guard let inputDate = date else {
                return ""
            }

            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE" // Monday
            return formatter.string(from: inputDate)
        }
    
    
}
