//
//  NetworkServiceError.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation

enum NetworkServiceError: Error{
    case incorrectHttpResponseCode
    case noDataFound
}
