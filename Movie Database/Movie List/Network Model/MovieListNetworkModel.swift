//
//  MovieListNetworkModel.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation


struct MovieListAPIs{
    let getListOfPopularMovies = "https://api.themoviedb.org/3/movie/popular"//"https://api.themoviedb.org/3/movie/popular?api_key=&language=en-US&page=1"
}

class MovieListNetworkModel{
    func networkRequest_GETMovieList(completionHandler: @escaping (Result<[Movie], Error>) -> Void){
        // create url
        var urlComponents = URLComponents(string: MovieListAPIs().getListOfPopularMovies)
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: API.apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")]
        
        guard let url = urlComponents?.url else {
            completionHandler(.failure(InternalNetworkServiceError.invalidApiURL))
            return
        }
        
        NetworkService.shared.networkRequest_GET(url) { (result: Result<[Movie], Error>) in
            switch result{
            case .success(let movies):
                completionHandler(.success(movies))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
