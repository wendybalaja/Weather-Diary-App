//
//  Constants.swift
//  Passwords
//
//  Created by Zhou, Meiwen on 12/3/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

public struct Constants {
    
    // Rochester, NY
    public static let latitude = 43.2360
    public static let longitude = -77.6933
    
    public static let apiKey = "339c9b7f2768c603000027483ba2b469"
    public static let baseUrl = "https://api.darksky.net/forecast/\(apiKey)/\(latitude),\(longitude)/"
}
