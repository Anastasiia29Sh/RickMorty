//
//  EpisodeDataService.swift
//  RickMortyGroupProject
//
//  Created by dan on 10.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import Foundation

class EpisodeDataService{
    
    private var dataTask: URLSessionDataTask?
    
    func episodeAPI(completion: @escaping(Result<Episodes, Error>) -> Void)
    {
        let url = URL(string: "https://rickandmortyapi.com/api/episode")
        
        dataTask = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            do{
                let jsonCharacter = try JSONDecoder().decode(Episodes.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(.success(jsonCharacter))
                }
            }catch let error{
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
