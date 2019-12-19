//
//  CampusWeatherViewController.swift
//  weatherJournal
//
//  Created by RYAN GREENBURG on 12/19/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

import UIKit

class CampusWeatherViewController: UIViewController {

    @IBOutlet weak var campusSegmentedControl: UISegmentedControl!
    @IBOutlet weak var timezoneLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var chanceOfStormLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataForSelectedSegment()
    }
    
    func fetchDataForSelectedSegment() {
        switch campusSegmentedControl.selectedSegmentIndex {
        case 0:
            lehiCampusFetch()
        case 1:
            dallasCampusFetch()
        case 2:
            phoenixCampusFetch()
        default:
            return
        }
    }
    
    func lehiCampusFetch() {
        DarkSkyService.fetchWeatherInfo(for: DarkSkyRoute.lehiCampus) { (result) in
            switch result {
            case .success(let lehi):
                print("Success for lehi")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func dallasCampusFetch() {
        DarkSkyService.fetchWeatherInfo(for: DarkSkyRoute.dallasCampus) { (result) in
            switch result {
            case .success(let dallas):
                print("success for dallas")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func phoenixCampusFetch() {
        DarkSkyService.fetchWeatherInfo(for: DarkSkyRoute.phoenixCampus) { (result) in
            switch result {
            case .success(let phoenix):
                print("Success for phoenix")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
