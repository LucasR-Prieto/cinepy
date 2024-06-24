//
//  homeViewModel.swift
//  cinePY
//
//  Created by lucas on 2024-06-21.
//

import Foundation
import UIKit


struct HomeViewModel {
    func getMovies(view: UIView   ,completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        HTTP().getRequest(endpoint: "/movie/now_playing", responseType: MovieResponse.self , view: view  ) { result in
            switch result {
            case .success(let response):
                for movie in response.results {
                    print("Movie: \(movie.title)")
                    print("Movie: \(movie.backdropPathUrl)")
                }
                completion(.success(response))
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func getMoviesPopulars(view: UIView   ,completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        HTTP().getRequest(endpoint: "/movie/popular", responseType: MovieResponse.self , view: view  ) { result in
            switch result {
            case .success(let response):
                for movie in response.results {
                    print("Movie: \(movie.title)")
                    print("Movie: \(movie.backdropPathUrl)")
                }
                completion(.success(response))
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
