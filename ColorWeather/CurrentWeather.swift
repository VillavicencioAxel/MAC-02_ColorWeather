//
//  CurrentWeather.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 16/01/23.
//

import Foundation

struct CurrentWeather {
    let temperature: Double
    let humidity : Double
    let summary : String
    let precipProbability: Double
    let icon: String
}


extension CurrentWeather {
    
    struct Key{
        
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let preciopProbability = "preciopProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init?(json: [String: AnyObject]) {
        
        guard let tempValue = json[Key.temperature] as? Double,
              let humidityValue = json[Key.humidity] as? Double,
              let preciopProbabilityValue = json[Key.preciopProbability] as? Double,
              let summaryValue = json[Key.summary] as? String,
              let iconStringValue = json[Key.icon] as? String else{
            
                return nil
        }
            
        self.temperature = tempValue
        self.humidity = humidityValue
        self.summary = summaryValue
        self.icon = iconStringValue
        self.precipProbability = preciopProbabilityValue
        
        
        
    }
    
}
