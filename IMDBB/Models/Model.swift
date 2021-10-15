//
//  Model.swift
//  IMDBB
//
//  Created by Adam Mierov on 11/10/2021.
//

import Foundation

struct Response: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String?
    let release_date: String?
    let vote_average: Double?
    let poster_path: String?
    let overview: String?
}
/*
{"page":1,
"results":[
    {"adult":false,
    "backdrop_path":"/t9nyF3r0WAlJ7Kr6xcRYI4jr9jm.jpg",
    "genre_ids":[878,28],
    "id":580489,
    "original_language":"en",
    "original_title":"Venom: Let There Be Carnage",
    "overview":"After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.",
    "popularity":10722.316,
    "poster_path":"/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg",
    "release_date":"2021-09-30",
    "title":"Venom: Let There Be Carnage",
    "video":false,
    "vote_average":7.2,
    "vote_count":477},
 */
