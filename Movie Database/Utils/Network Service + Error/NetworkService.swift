//
//  NetworkService.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation
import SwiftyJSON


class API{
    static let apiKey = "38a73d59546aa378980a88b645f487fc"
    
}

class NetworkService{
    
    static let shared = NetworkService()
    
    /**
     Makes a GET network request
     */
    func networkRequest_GET<T: Decodable>(_ url: URL, completionHandler: @escaping (Result<T, Error>) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{
                
                // check for error
                guard error == nil else { throw error! }
                
                // check if response code is valid
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...300).contains(httpResponse.statusCode) else {
                          throw NetworkServiceError.incorrectHttpResponseCode
                      }
                
                // if data present then decode it
                guard let data = data else { throw NetworkServiceError.noDataFound }
                
                let json = try JSON(data: data)
                print(json)
                
                let model = try JSONDecoder().decode(T.self, from: json["results"].rawData())
                completionHandler(.success(model))
                
            }catch let error{
                completionHandler(.failure(error))
            }
            
        }.resume()
    }
}


