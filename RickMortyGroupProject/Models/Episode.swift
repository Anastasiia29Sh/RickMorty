//
//  Episode.swift
//  RickMortyGroupProject
//
//  Created by dan on 09.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

struct Episodes: Decodable{
    let info: InfoL
    let results: [ResultsE]
}
struct InfoE : Decodable{
    let count:Int//": 826,
    let pages:Int//": 42,
    let next:String//": "
    let prev:String?//": null
}
struct ResultsE: Decodable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}
