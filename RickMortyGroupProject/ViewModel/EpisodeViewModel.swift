//
//  EpisodeViewModel.swift
//  RickMortyGroupProject
//
//  Created by dan on 10.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import Foundation

class EpisodeViewModel{
    private var episodeDataService = EpisodeDataService()
    private var episodes = [ResultsE]()
    
    func getAllEpisodes(completion: @escaping () -> ()){
        episodeDataService.episodeAPI{ [weak self] (result) in
            switch result{
            case .success(let dictEpisodes):
                self?.episodes = dictEpisodes.results
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    func rowNumbers(section: Int) -> Int{
        return episodes.count
    }
    func cellForRowAt(indexPath: IndexPath) -> ResultsE{
        return episodes[indexPath.row]
    }
}
