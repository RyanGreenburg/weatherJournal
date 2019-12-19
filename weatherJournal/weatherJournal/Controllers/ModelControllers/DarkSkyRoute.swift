//
//  DarkSkyService.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation
import CoreLocation

struct DSRConstants {
    static let baseURL = "https://api.darksky.net/"
    static let forcastComponent = "forecast"
    static let apiKey = "3402c874e274360b8ae3f607fbdaedd0"
    static let lehiCampus = (lat: "40.3916", lng: "-111.8508")
    static let dallasCampus = (lat: "32.7767", lng: "-96.7970")
    static let phoenixCampus = (lat: "33.4484", lng: "-112.0740")
}

enum DarkSkyRoute {
    
    case lehiCampus
    case dallasCampus
    case phoenixCampus
    case givenLocation
    
    var coordinatesPath: String {
        switch self {
        case .lehiCampus:
            return "\(DSRConstants.lehiCampus.lat),\(DSRConstants.lehiCampus.lng)"
        case .dallasCampus:
            return "\(DSRConstants.dallasCampus.lat),\(DSRConstants.dallasCampus.lng)"
        case .phoenixCampus:
            return "\(DSRConstants.phoenixCampus.lat),\(DSRConstants.phoenixCampus.lng)"
        case .givenLocation:
            return "forcast/\(DSRConstants.apiKey)"
        }
    }
    
    var finalURL: URL? {
        switch self {
        case .lehiCampus:
            return URL(string: DSRConstants.baseURL)?.appendingPathComponent(DSRConstants.forcastComponent).appendingPathComponent(DSRConstants.apiKey).appendingPathComponent(coordinatesPath)
        case .dallasCampus:
            return URL(string: DSRConstants.baseURL)?.appendingPathComponent(DSRConstants.forcastComponent).appendingPathComponent(DSRConstants.apiKey).appendingPathComponent(coordinatesPath)
        case .phoenixCampus:
            return URL(string: DSRConstants.baseURL)?.appendingPathComponent(DSRConstants.forcastComponent).appendingPathComponent(DSRConstants.apiKey).appendingPathComponent(coordinatesPath)
        case .givenLocation:
            return URL(string: DSRConstants.baseURL)?.appendingPathComponent(coordinatesPath)
        }
        return nil
    }
    
    func weatherForGivenLocation(lat: String, lng: String) -> URL? {
        guard let url = finalURL else { return nil }
        return url.appendingPathComponent(lat).appendingPathComponent(lng)
    }
}
