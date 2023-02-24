//
//  Coordinate.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 3/02/23.
//

import Foundation

struct Coordinate: CustomStringConvertible {
    var description: String{
        return "\(latitude),\(longitude)"
    }
    
    let latitude: Double
    let longitude: Double
}
