//
//  Location.swift
//  RickMortyGroupProject
//
//  Created by dan on 09.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

struct Locations: Decodable{
    let info: InfoL
    let results: [ResultsL]
}
struct InfoL : Decodable{
    let count:Int//": 826,
    let pages:Int//": 42,
    let next:String//": "
    let prev:String?//": null
}
struct ResultsL: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}
