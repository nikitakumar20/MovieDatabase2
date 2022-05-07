//
//  MovieListViewModel.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation

class MovieListViewModel{
    
    private var movies = [Movie]()
    
    private let networkModel = MovieListNetworkModel()
    
    func getMoviesCount() -> Int{
        movies.count
    }
    func getTableCellViewModel(for index: Int) -> MovieListTableViewCellViewModel{
        .init(movies[index])
    }
    func getMovieDetailsViewModel(for index: Int) -> MovieDetailsViewModel{
        .init(movies[index])
    }
    func getListOfMovies(completionHandler: @escaping (Result<Void, Error>) -> Void){
        
        networkModel.networkRequest_GETMovieList { result in
            switch result{
            case .success(let movies):
                self.movies = movies
                completionHandler(.success(()))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
