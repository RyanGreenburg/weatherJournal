//
//  GithubJobsService.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct GithubJobsService {
    
    enum GithubJobsError: Error {
        case invalidURL
        case unableToDecodeData(Error)
    }
    
    static func fetchJobs(for route: GithubJobsRoute, completion: @escaping (Result<[JobListing], GithubJobsError>) -> Void) {
        guard let url = route.finalURL else {
            completion(.failure(.invalidURL))
            return
        }
        
        APIController.fetchData(for: url) { (result) in
            do {
                let foundData = try result.get()
                let decoder = JSONDecoder()
                let listings = try decoder.decode([JobListing].self, from: foundData)
                completion(.success(listings))
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(.failure(.unableToDecodeData(error)))
            }
        }
    }
}
