//
//  LocationViewModel.swift
//  RickMortyGroupProject
//
//  Created by dan on 10.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import Foundation

class LocationViewModel{
    private var locationDataService = LocationDataService()
    private var locations = [ResultsL]()
    
    func getAllLocations(completion: @escaping () -> ()){
        locationDataService.locationAPI{ [weak self] (result) in
            switch result{
            case .success(let dictLocations):
                self?.locations = dictLocations.results
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    func rowNumbers(section: Int) -> Int{
        return locations.count
    }
    func cellForRowAt(indexPath: IndexPath) -> ResultsL{
        return locations[indexPath.row]
    }
}
