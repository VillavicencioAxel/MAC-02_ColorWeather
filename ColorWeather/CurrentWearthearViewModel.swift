//
//  CurrentWearthearViewModel.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 19/01/23.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel{
    let temperature: String
    let humidity : String
    let precipProbability: String
    let summary : String
    let icon: UIImage
    
    init(model: CurrentWeather){
        let temperatureRounded = Int(model.temperature)
        let humidityInPercent = Int(model.humidity * 100)
        let precipInPercent = Int(model.precipProbability * 100)
        let icon = WeatherIcon(icon: model.icon)
        
        self.temperature = "\(temperatureRounded)"
        self.humidity = "\(humidityInPercent)%"
        self.precipProbability = "\(precipInPercent)%"
        self.summary = model.summary
        self.icon = icon.image
    }
}
