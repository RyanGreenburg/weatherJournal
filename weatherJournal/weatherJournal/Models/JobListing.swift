//
//  Position.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import Foundation

struct JobListing: Decodable {
    let company: String
    let location: String
    let title: String
    let description: String
}
