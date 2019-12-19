//
//  Weather.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let timezone: String
    let currentWeather: WeatherSnapshot
    
    enum CodingKeys: String, CodingKey {
        case timezone
        case currentWeather = "currently"
    }
}

struct WeatherSnapshot: Codable {
    let summary: String
    let time: Int
    let icon: String
    let chanceOfStorm: Double
    let temperature: Double
    
    enum CodingKeys: String, CodingKey {
        case summary
        case time
        case icon
        case chanceOfStorm = "precipProbability"
        case temperature
    }
}
