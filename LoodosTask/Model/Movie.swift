//
//  Movie.swift
//  LoodosTask
//
//  Created by Cem Eke on 3.12.2021.
//

import Foundation

struct Movie: Codable {
    let title, year, rated, released: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case poster = "Poster"
    }
}

