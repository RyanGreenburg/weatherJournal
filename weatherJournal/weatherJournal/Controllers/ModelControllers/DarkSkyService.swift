//
//  DarkSkyService.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct DarkSkyService {
    
    enum DarkSkyError: Error {
        case invalidURL
        case unableToDecodeData(Error)
    }
    
    static func fetchWeatherInfo(for route: DarkSkyRoute, completion: @escaping (Result<Weather, DarkSkyError>) -> Void) {
        var routeURL: URL?
        
        switch route {
        case .lehiCampus:
            routeURL = route.finalURL
        case .dallasCampus:
            routeURL = route.finalURL
        case .phoenixCampus:
            routeURL = route.finalURL
        default:
            break
        }
        
        guard let url = routeURL else {
            completion(.failure(.invalidURL))
            return
        }
        
        APIController.fetchData(for: url) { (result) in
            
            do {
                let foundData = try result.get()
                let decoder = JSONDecoder()
                let weather = try decoder.decode(Weather.self, from: foundData)
                completion(.success(weather))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.unableToDecodeData(error)))
            }
        }
    }
}
