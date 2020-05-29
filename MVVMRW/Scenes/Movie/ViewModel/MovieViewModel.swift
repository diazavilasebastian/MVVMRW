//
//  MovieViewModel.swift
//  MVVMRW
//
//  Created by ITAU on 29-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import SDWebImage
import iOSMovieDB

struct MovieViewModel: MovieViewModelProtocol {
    private var movieResume: MovieResume
    var image: UIImage

    var title: String {
        self.movieResume.title
    }

    var overview: String {
        self.movieResume.overview
    }

    var popularity: Double {
        self.movieResume.popularity
    }

    init(movie: MovieResume, image: UIImage) {
        self.movieResume = movie
        self.image = image

    }
}
