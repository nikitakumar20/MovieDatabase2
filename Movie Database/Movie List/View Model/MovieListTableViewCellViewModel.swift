//
//  MovieListTableViewCellViewModel.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation

class MovieListTableViewCellViewModel{
    private var movie = Movie()
    
    init(){
        
    }
    init(_ movie: Movie){
        self.movie = movie
    }
    
    func getTitle() -> String{ movie.title }
    func getDescription() -> String{ movie.overview }
    func getImageDownloadURLString() -> String{
        "https://image.tmdb.org/t/p/w500/\(movie.poster_path)"
    }
}
