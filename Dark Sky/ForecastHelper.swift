//
//  DarkSky.swift
//  Forecaste
//
//  Created by CSC214 Instructor on 8/12/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

enum ForecastHelperResult {
    case Success([Forecast])
    case Failure(Error)
}

class ForecastHelper {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchForecast(completion: @escaping (ForecastHelperResult) -> Void) {
        
        var language = "en"
        if let deviceLanguage = Locale.current.languageCode {
            if deviceLanguage == "de" || deviceLanguage == "fr" {
                language = deviceLanguage
            }
        }
        
        let params = [
            "exclude": "currently,minutely,hourly,alerts,flags",
            "units": "auto",
            "lang": language]
        
        let url = DarkSkyAPI.darkSkyURL(parameters: params)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            guard let jsonData = data else {
                completion(.Failure(error!))
                return
            }
            OperationQueue.main.addOperation {
                completion(DarkSkyAPI.forecast(fromJSON: jsonData)!)
            }
        })
        task.resume()
    }
}


