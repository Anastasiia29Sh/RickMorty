//
//  CharacterDataService.swift
//  RickMortyGroupProject
//
//  Created by dan on 09.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import Foundation


class CharacterDataService{
    
    private var dataTask: URLSessionDataTask?
    
    func characterAPI(completion: @escaping(Result<Characters, Error>) -> Void)
    {
        let url = URL(string: "https://rickandmortyapi.com/api/character")
        
        dataTask = URLSession.shared.dataTask(with: url!){ (data, response, error) in
            do{
                let jsonCharacter = try JSONDecoder().decode(Characters.self, from: data!)
                
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
