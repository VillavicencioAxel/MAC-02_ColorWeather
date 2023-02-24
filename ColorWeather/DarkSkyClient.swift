//
//  DarkSkyClient.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 3/02/23.
//

import Foundation

class DarkSkyClient {
    
    fileprivate let apiKey = "123fsdt3456bfvbvf23"
    
    lazy var baseURL : URL = {
        return URL(string: "https://api.appstoreconnect.apple.com/v1/apps/\(apiKey)/")!
    }()
    
    let jsonDownloder = JSONDownloader()
    
    typealias CurrentWeatherCompletionHander = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(coordinate: Coordinate, completion: @escaping CurrentWeatherCompletionHander) -> Void{
        
        guard let url = URL (string: coordinate.description, relativeTo: baseURL) else{
            completion (nil, DarkSkyError.invalidURL)
            return
        }
        
        let request = URLRequest( url : url)
        
        let task = jsonDownloder.jsonTask(request: request) {(json,error) in
            
            DispatchQueue.main.async {
                
                guard let json = json else{
                    
                    completion(nil, error)
                    return
                    
                }
                
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather (json: currentWeatherJson) else{
                    completion(nil, .jsonParsingError)
                    return
                }
                
                completion(currentWeather, nil)
                
            }
            
        }
        
        task.resume()
        
    }
    
    
}
