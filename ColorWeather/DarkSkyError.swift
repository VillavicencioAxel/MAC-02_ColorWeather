//
//  DarkSkyError.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 1/02/23.
//

import Foundation


enum DarkSkyError : Error{
    case requestFailed
    case responseUnsuccsesfull
    case invalidData
    case jsonConversionFailure
    case invalidURL
    case jsonParsingError
    
}
