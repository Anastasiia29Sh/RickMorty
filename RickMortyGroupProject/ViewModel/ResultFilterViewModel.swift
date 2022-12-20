//
//  ResultFilterModel.swift
//  RickMortyGroupProject
//
//  Created by dan on 15.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import Foundation

class ResultFilterViewModel{
    private var resultFilter = [Results]()
    
    func resultFilterList() -> [Results]{
        return resultFilter
    }
    func reloadResultFilter(newResult: [Results]){
        self.resultFilter = newResult
    }
}
