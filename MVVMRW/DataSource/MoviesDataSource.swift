//
//  MoviesDataSource.swift
//  MVVMRW
//
//  Created by ITAU on 17-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MovieDataSource {

    private var movies: [MovieResume]

    init() {
        movies = []
    }

    func appendMovies(newMovies: [MovieResume]) {
        movies.append(contentsOf: newMovies)
    }

    func getMovie(id: Int) -> MovieResume? {
        return nil
    }


}
