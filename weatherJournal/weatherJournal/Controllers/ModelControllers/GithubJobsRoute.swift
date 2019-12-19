//
//  GithubJobsRoute.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

enum GithubJobsRoute {
    static let baseURL = "https://jobs.github.com"
    
    case lehi
    case dallas
    case phoenix
    
    var coordinatesQueryItems: [URLQueryItem] {
        switch self {
        case .lehi:
            return [URLQueryItem(name: "lat", value: DSRConstants.lehiCampus.lat), URLQueryItem(name: "lng", value: DSRConstants.lehiCampus.lng)]
        case .dallas:
            return [URLQueryItem(name: "lat", value: DSRConstants.dallasCampus.lat), URLQueryItem(name: "lng", value: DSRConstants.dallasCampus.lng)]
        case .phoenix:
            return [URLQueryItem(name: "lat", value: DSRConstants.phoenixCampus.lat), URLQueryItem(name: "lng", value: DSRConstants.phoenixCampus.lng)]
        }
    }
    
    var path: String {
        return "positions.json"
    }
    
    var finalURL: URL? {
        switch self {
        case .lehi:
            guard let url = URL(string: GithubJobsRoute.baseURL)?.appendingPathComponent(path) else { return nil }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = coordinatesQueryItems
            return components?.url
        case .dallas:
            guard let url = URL(string: GithubJobsRoute.baseURL)?.appendingPathComponent(path) else { return nil }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = coordinatesQueryItems
            return components?.url
        case .phoenix:
            guard let url = URL(string: GithubJobsRoute.baseURL)?.appendingPathComponent(path) else { return nil }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = coordinatesQueryItems
            return components?.url
        }
    }
}
