//
//  MovieDetailsViewModel.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation

class MovieDetailsViewModel{
    let movie: Movie
    
    init(_ movie: Movie){
        self.movie = movie
    }
    
    func getImageDownloadURLString() -> String{
        "https://image.tmdb.org/t/p/w500/\(movie.poster_path)"
    }
    func getReleaseDate() -> String{
        movie.release_date
    }
    func getRating() -> String{
        String(movie.vote_average)
    }
    func getPopularity() -> String{
        String(movie.vote_count)
    }
}
