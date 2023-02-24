//
//  Weathericon.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 16/01/23.
//

import Foundation
import UIKit

enum WeatherIcon{
    
    case clearDay
    case clearNight
    case rain
    case snow
    case sleet
    case wind
    case fog
    case cloudy
    case partyCloudyDay
    case partyCloudyNight
    case `default`
    
    init(icon: String){
        switch icon {
        case "clear-day": self = .clearDay
        case "clear_nigth": self = .clearNight
        case "rain": self = .rain
        case "snow": self = .snow
        case "sleet": self = .sleet
        case "wind": self = .wind
        case "fog": self = .fog
        case"cloudy": self = .cloudy
        case"party-cloudy-day": self = .partyCloudyDay
        case"party-cloudy-nigth": self = .partyCloudyNight
        default: self = .default
        }
    }
}

extension WeatherIcon{
    
    var image: UIImage{
        
        switch self{
        case .clearDay: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .clearNight: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .rain: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .snow: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .sleet: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .wind: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .fog: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .cloudy: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .partyCloudyDay: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        case .partyCloudyNight: return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
        default:
            return UIImage(named: "sol") ?? UIImage(systemName: "circle.slash")!
            
        }
        
    }
    
}


