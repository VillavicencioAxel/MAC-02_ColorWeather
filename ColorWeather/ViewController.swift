//
//  ViewController.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 12/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecidipitationLabel: UILabel!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    fileprivate let apiKey = "123fsdt3456bfvbvf23"
    
    let client = DarkSkyClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentWeather()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func getCurrentWeather() {
        
        refreshAnimation(on: true)
        
        let coordinate = Coordinate(latitude: 42.3601, longitude: -71.0589)
        
        client.getCurrentWeather(coordinate: coordinate) {[unowned self] (currentWeather, error) in
            
            if let currentWeather = currentWeather{
                
                    let viewModel = CurrentWeatherViewModel(model: currentWeather)
                    self.displayWeather(currentWeatherViewModel: viewModel)
                    refreshAnimation(on: false)
                    
                
            }
            
        }
        
    }
    
    func displayWeather(currentWeatherViewModel: CurrentWeatherViewModel){
        
        currentWeatherIcon.image = currentWeatherViewModel.icon
        
        currentTemperatureLabel.text = currentWeatherViewModel.temperature
        
        currentSummaryLabel.text = currentWeatherViewModel.summary
        
        currentHumidityLabel.text = currentWeatherViewModel.humidity
        
        currentPrecidipitationLabel.text = currentWeatherViewModel.precipProbability
        
    }

    func refreshAnimation(on: Bool){
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        }else{
            activityIndicator.stopAnimating()
        }
            
    }
    
    
}

