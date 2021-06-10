//
//  MovieModel.swift
//  TopTen
//
//  Created by Jessica Vera Perez on 08/06/21.
//

import Foundation

struct MovieModel: Decodable {
    let id: Int
    let language: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let date: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}
