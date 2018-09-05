//
//  NowPlayingViewModel.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import Foundation

class NowPlayingViewModel {
    
    var apiClient: MovieAPIProtocol!
    var movies: [Movie] = []
    
    init(apiClient: MovieAPIProtocol) {
        self.apiClient = apiClient
    }
    
    func getMovies(completion: @escaping () -> Void) {
        apiClient.getNowPlaying { [weak self] (movieList, error) in
            if error == nil {
                self?.movies = movieList
            }
            completion()
        }
    }
    
    func getTitle() -> String {
        return "Now Playing"
    }
    
    func numberOfItems() -> Int {
        return movies.count
    }
    
    func titleForCell(at indexPath: IndexPath) -> String {
        return movies[indexPath.row].title
    }
}
