//
//  JSONDownloader.swift
//  ColorWeather
//
//  Created by Carlos Villavicencio Vasquez on 1/02/23.
//

import Foundation

class JSONDownloader{
    
    let session: URLSession
    init(configuration: URLSessionConfiguration){
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init(){
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    
    typealias JsonCompletionHandler = (JSON?, DarkSkyError?)-> Void
    
    func jsonTask(request: URLRequest, completion: @escaping JsonCompletionHandler) -> URLSessionTask{
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else{
                //algo con el error
                completion(nil, .requestFailed)
                return
            }
            
            if httpResponse.statusCode == 200{
                //Tuvimos exito
                
                if let data = data{
                    //tenemos datos validos
                    do{
                        let json = try JSONSerialization.jsonObject(with: data,options: []) as? [String: AnyObject]
                        
                        completion(json, nil)
                    }catch{
                        
                        completion(nil, .jsonConversionFailure)
                    }
                }else{
                    //tenemos datos no validos
                    completion(nil, .invalidData)
                }
                
            }else{
                //Hubo problemas
                completion(nil, .responseUnsuccsesfull)
            }
            
        }
        return task
        
    }
    
    
}
