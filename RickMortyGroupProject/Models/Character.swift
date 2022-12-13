//
//  Characters.swift
//  RickMortyGroupProject
//
//  Created by dan on 09.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

struct Characters : Decodable{
    let info: Info
    let results: [Results]
}
struct Info : Decodable{
    let count:Int//": 826,
    let pages:Int//": 42,
    let next:String//": "
    let prev:String?//": null
}
struct Results: Decodable {
    let id: Int
    let name: String
    let status: String
    let gender: String
    let image: String
}
