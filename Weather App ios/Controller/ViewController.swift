//
//  ViewController.swift
//  Weather App ios
//
//  Created by turbo on 08.03.2021.
//

import UIKit
import CoreLocation






class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    
    

    @IBOutlet var table: UITableView!
    
    var models = [DailyWeatherEntry]()
    
    
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var current: CurrentWeather?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        table.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: HourlyTableViewCell.identifier  )
        table.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.identifier )
        
        
        table.delegate = self
        table.dataSource = self
        
        
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
        
    }
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil{
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation  else {
            return
        }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        
        let url = "https://api.darksky.net/forecast/WBAQaDeOQzg1bFhS1BJgSOmW3HLx1sCJ/\(lat),\(long)?exclude=[flags,minutely]"
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data,response,error in
            
            
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
        }).resume()
        
    }
    
    
    

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    
    
    
    
}

