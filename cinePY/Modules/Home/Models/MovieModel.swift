//
//  MovieModel.swift
//  cinePY
//
//  Created by lucas on 2024-06-21.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let backdropPath: String?
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let posterPath: String?
    let originalLanguage: String
    let voteCount: Int
    let genreIds: [Int]
    let adult: Bool
    let popularity: Double
    var backdropPathUrl :String  {
        let url = "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")"
        return url
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdropPath = "backdrop_path"
        case overview
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case genreIds = "genre_ids"
        case adult
        case popularity
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


