//
//  CharacterViewModel.swift
//  RickMortyGroupProject
//
//  Created by dan on 09.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import Foundation

class CharacterViewModel{
    private var characterDataService = CharacterDataService()
    private var characters = [Results]()
    
    func getAllCharacters(completion: @escaping () -> ()){
        characterDataService.characterAPI{ [weak self] (result) in
            switch result{
            case .success(let dictCharacters):
                self?.characters = dictCharacters.results
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func charactersList() -> [Results]{
        return characters
    }
    
    func rowNumbers(section: Int) -> Int{
        return characters.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Results{
        return characters[indexPath.row]
    }
    
    func removeCharacters(){
        self.characters.removeAll()
    }
    
    func appendCharacter(newCharacter: Results){
        self.characters.append(newCharacter)
    }
    
    func reloadCharacters(newCharacters: [Results]){
        self.characters = newCharacters
    }
}
