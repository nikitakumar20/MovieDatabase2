//
//  Movie.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation

struct Movie: Decodable{
    var title = String()
    var overview = String()
    var poster_path = String()
    var release_date = String()
    var vote_average = Double()
    var vote_count = Int()
}
